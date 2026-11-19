#!/usr/bin/env python3
"""Build (and optionally deploy) the PUBLIC version of the course website.

The full site (all lessons) is what you work on locally with `quarto preview`.
This script builds a reduced copy that contains every lesson up to today
(all sessions whose date is today or earlier); future lessons become
placeholders with no page behind them and never leave your computer.

Usage (run from anywhere):
  python3 website/publish.py                 # build into website/_site_public
  python3 website/publish.py --date 2026-11-14   # pretend today is that date
  python3 website/publish.py --session 3     # force session 3 as "current"
  python3 website/publish.py --deploy        # build, then push to gh-pages
"""
import argparse, datetime as dt, re, shutil, subprocess, sys, tempfile, tomllib
from pathlib import Path

SITE = Path(__file__).resolve().parent
REPO = SITE.parent
OUT = SITE / "_site_public"
SKIP = {"_site", "_site_public", ".quarto", "__pycache__", "schedule.toml", "publish.py"}


def num(s):
    """Session number shown to students, taken from the folder prefix (00-welcome -> 0)."""
    return int(s["dir"].split("-")[0])


def pick(sessions, today, forced):
    if forced is not None:
        return next(i for i, s in enumerate(sessions) if num(s) == forced)
    cur = -1
    for i, s in enumerate(sessions):
        if s["date"] <= today:
            cur = i
    return cur


def card(i, s, state, summary=""):
    n, when = num(s), s["date"].strftime("%d %B %Y").lstrip("0")
    if state == "live":
        d = s["dir"]
        links = f"[Material →]({d}/index.qmd)" + (f" · [Slides →]({d}/slides.qmd)" if (SITE / "sessions" / d / "slides.qmd").exists() else "")
        return f"::: {{.session-card}}\n### {n}. {s['title']}\n{when}\n\n{links}\n:::\n"
    label = "Coming soon" if state == "future" else "No longer online"
    return f"::: {{.session-card .session-card-locked}}\n### {n}. {s['title']}\n{label} — {when}\n:::\n"


QUIZ_INTRO = (
    "All the live quizzes and the classroom material of the course, in one place. "
    "Use the quizzes to check yourself again before the exam!\n\n"
)


def resources(sessions, root):
    """Quiz links and Classroom Material of every session whose folder exists under root.

    A quiz under a heading like "Review of Session N" belongs to session N; any other quiz
    belongs to the session whose page it is on. Placeholder links are ignored.
    """
    quizzes, material = {}, {}
    for s in sessions:
        page = root / "sessions" / s["dir"] / "index.qmd"
        if not page.exists():
            continue
        heading, section = "", None
        for line in page.read_text().splitlines():
            if line.startswith("## "):
                heading = line
                section = "material" if line.strip() == "## Classroom Material" else None
                continue
            for url in re.findall(r"\((https://forms\.gle/[^)\s]+)\)", line):
                m = re.search(r"Review of Session (\d+)", heading)
                quizzes.setdefault(int(m.group(1)) if m else num(s), url)
            if section and line.startswith("- "):
                item = re.sub(r"\]\((?!https?://)([^)]+)\)", rf"](sessions/{s['dir']}/\1)", line[2:].strip())
                material.setdefault(num(s), []).append(item)
    return quizzes, material


def quiz_page(sessions, root):
    quizzes, material = resources(sessions, root)
    rows = []
    for s in sessions:
        n = num(s)
        if not (root / "sessions" / s["dir"]).exists() or (n not in quizzes and n not in material):
            continue
        quiz = f"[Open the quiz →]({quizzes[n]})" if n in quizzes else "—"
        mat = "<br>".join(material.get(n, [])) or "—"
        rows.append(f"| [{n}. {s['title']}](sessions/{s['dir']}/index.qmd) | {quiz} | {mat} |")
    table = "| Session | Quiz | Classroom material |\n|---|---|---|\n" + "\n".join(rows) if rows else "Nothing here yet."
    return '---\ntitle: "Quizzes & Material"\n---\n\n' + QUIZ_INTRO + table + "\n"


def build(sessions, cur):
    live = set(range(0, cur + 1))  # every session up to and including the current one
    shutil.rmtree(OUT, ignore_errors=True)  # start clean so no stale pages get published
    tmp = Path(tempfile.mkdtemp(prefix="einstein-public-"))
    for p in SITE.iterdir():
        if p.name in SKIP or p.name == "sessions":
            continue
        shutil.copytree(p, tmp / p.name) if p.is_dir() else shutil.copy2(p, tmp / p.name)
    (tmp / "sessions").mkdir()
    for i in live:
        shutil.copytree(SITE / "sessions" / sessions[i]["dir"], tmp / "sessions" / sessions[i]["dir"])

    # sessions overview: placeholders for everything that is not live
    cards = "\n".join(
        card(i, s, "live" if i in live else "past" if i < cur else "future") for i, s in enumerate(sessions)
    )
    (tmp / "sessions" / "index.qmd").write_text('---\ntitle: "Sessions"\n---\n\n' + cards)

    # quizzes & material table: only the sessions that are online
    (tmp / "quizzes.qmd").write_text(quiz_page(sessions, tmp))

    # navigation: plain text (no link) for placeholders
    cfg = (SITE / "_quarto.yml").read_text()
    items = "\n".join(
        f"          - sessions/{s['dir']}/index.qmd" if i in live else f"          - text: \"{num(s)}. {s['title']}\""
        for i, s in enumerate(sessions)
    )
    cfg = re.sub(r"(          - sessions/index\.qmd\n)(?:          - .*\n)+", lambda m: m.group(1) + items + "\n", cfg)
    (tmp / "_quarto.yml").write_text(cfg)

    # strip teacher-only bits from the copied pages
    for f in tmp.glob("sessions/*/*.qmd"):
        t = f.read_text()
        t = re.sub(r"::: \{\.callout-important\}\n\*\*Before class:\*\*.*?\n:::\n", "", t, flags=re.S)
        f.write_text(t)
        if "REPLACE_WITH_YOUR_GOOGLE_FORM_LINK" in t:
            print(f"WARNING: {f.relative_to(tmp)} still contains the placeholder quiz link", file=sys.stderr)

    subprocess.run(["quarto", "render", str(tmp), "--output-dir", str(OUT)], check=True)
    # quarto resolves --output-dir relative to the project; make sure it landed
    out = tmp / OUT.name if (tmp / OUT.name).exists() else OUT
    if out != OUT:
        shutil.rmtree(OUT, ignore_errors=True)
        shutil.move(str(out), str(OUT))
    shutil.rmtree(tmp, ignore_errors=True)
    return live


def deploy():
    wt = Path(tempfile.mkdtemp(prefix="einstein-ghpages-"))
    git = lambda *a, cwd=REPO: subprocess.run(["git", *a], cwd=cwd, check=True)
    has = subprocess.run(["git", "rev-parse", "--verify", "gh-pages"], cwd=REPO, capture_output=True).returncode == 0
    if has:
        git("worktree", "add", str(wt), "gh-pages")
    else:
        git("worktree", "add", "--detach", str(wt))
        git("checkout", "--orphan", "gh-pages", cwd=wt)
    try:
        for p in wt.iterdir():
            if p.name != ".git":
                shutil.rmtree(p) if p.is_dir() else p.unlink()
        for p in OUT.iterdir():
            shutil.copytree(p, wt / p.name) if p.is_dir() else shutil.copy2(p, wt / p.name)
        (wt / ".nojekyll").touch()
        git("add", "-A", cwd=wt)
        git("commit", "-m", f"Publish site {dt.date.today()}", "--allow-empty", cwd=wt)
        git("push", "origin", "gh-pages", cwd=wt)
    finally:
        git("worktree", "remove", "--force", str(wt))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--date", type=dt.date.fromisoformat, default=dt.date.today())
    ap.add_argument("--session", type=int, help="force this session number as the current one")
    ap.add_argument("--deploy", action="store_true", help="push the built site to the gh-pages branch")
    a = ap.parse_args()
    sessions = tomllib.loads((SITE / "schedule.toml").read_text())["session"]
    cur = pick(sessions, a.date, a.session)
    live = build(sessions, cur)
    names = [sessions[i]["dir"] for i in sorted(live)] or ["(none yet: course not started, all placeholders)"]
    print("Published lessons:", ", ".join(names), "->", OUT)
    if a.deploy:
        deploy()


if __name__ == "__main__":
    main()
