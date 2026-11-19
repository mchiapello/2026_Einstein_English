// Session 3 worksheet — ANSWER KEY (teacher copy). Build the PDF with:
//   quarto typst compile dna-worksheet-solutions.typ
// Same layout as dna-worksheet.typ, with the answers filled in red.

#set page(paper: "a4", margin: (x: 2cm, y: 1.8cm),
  footer: align(center, text(8pt, fill: gray)[Scientific English — Liceo Einstein · Session 3: Understanding DNA · Answer key]))
#set text(font: ("Helvetica", "Arial"), size: 10.5pt)
#set par(justify: false, leading: 0.6em)
#let blue = rgb("#1d5c9c")
#let red = rgb("#c1121f")
#let ans(body) = text(fill: red, weight: "bold", body)
#let section(title) = {
  v(0.8em)
  block(fill: blue, inset: (x: 8pt, y: 5pt), radius: 3pt, width: 100%,
    text(fill: white, weight: "bold", size: 12pt, title))
  v(0.3em)
}
#let circled(t) = box(stroke: 1.2pt + red, radius: 50%, inset: (x: 3pt, y: 1pt), text(fill: red, weight: "bold", t))

#align(center)[
  #text(18pt, weight: "bold", fill: blue)[Exploring DNA — Answer Key] \
  #text(11pt)[Classroom worksheet — Session 3 · Teacher copy]
]

#section[A. True or False]
Circle *T* (true) or *F* (false). If a statement is false, rewrite it so that it is true.

#let tf(n, ok, s, fix) = {
  grid(columns: (1.2em, 1fr, 3.6em), gutter: 6pt, [*#n.*], s,
    if ok { [#circled[T] #h(2pt) *F*] } else { [*T* #h(2pt) #circled[F]] })
  v(0.15em)
  pad(left: 1.2em, ans(fix))
  v(0.45em)
}
#tf(1, false)[The double helix structure of DNA was discovered in 1869.][The double helix was discovered in *1953*. (DNA itself was first isolated in 1869.)]
#tf(2, true)[A nucleotide is made of a phosphate group, a sugar and a nitrogenous base.][Correct as written.]
#tf(3, false)[In DNA, adenine (A) always pairs with guanine (G).][Adenine (A) always pairs with *thymine (T)*; guanine (G) pairs with cytosine (C).]
#tf(4, false)[Most mutations are harmful.][Most mutations are *neutral*: they have no noticeable effect.]
#tf(5, false)[Most human cells contain 23 chromosomes.][Most human cells contain *46* chromosomes (23 pairs). Only eggs and sperm have 23.]

#section[B. Matching]
Write the letter of the correct definition next to each term.

#grid(columns: (3.2cm, 1.4cm, 1fr), row-gutter: 9pt, column-gutter: 6pt,
  [1. nucleotide], ans[d], [*a.* the complete set of DNA of an organism],
  [2. gene], ans[f], [*b.* two bases joined by hydrogen bonds, such as A–T],
  [3. genome], ans[a], [*c.* the process that copies DNA before a cell divides],
  [4. chromosome], ans[h], [*d.* the building block of DNA: phosphate + sugar + base],
  [5. base pair], ans[b], [*e.* a protein that DNA is wound around, like thread on a spool],
  [6. mutation], ans[g], [*f.* a stretch of DNA with the instructions for one product, usually a protein],
  [7. replication], ans[c], [*g.* a change in the DNA sequence],
  [8. histone], ans[e], [*h.* a tightly packed structure of DNA and proteins; humans have 46],
)

#section[C. Complementary strands]
#let strand(s, c: black) = text(font: ("Menlo", "Courier New"), size: 13pt, weight: "bold", tracking: 3pt, fill: c, s)

*1.* Write the complementary strand. #h(1fr) #strand[TTAGCCATGC] \
#h(1fr) #strand(c: red)[AATCGGTACG]

*2.* Write the complementary strand. #h(1fr) #strand[CGAATTCGTA] \
#h(1fr) #strand(c: red)[GCTTAAGCAT]

*3.* A DNA sample contains *30 % adenine*. Use the base-pairing rule (Chargaff's rules) to find the percentage of the other bases.

#h(2em) T = #ans[30] % #h(3em) G = #ans[20] % #h(3em) C = #ans[20] %

#pad(left: 2em, ans[A = T, so A + T = 60 %. The remaining 40 % is split equally between G and C.])

*4.* Which DNA is harder to separate into two strands: DNA rich in *A–T* pairs, or DNA rich in *G–C* pairs? Explain why.

#pad(left: 2em, ans[DNA rich in G–C pairs, because each G–C pair is held by 3 hydrogen bonds, while each A–T pair has only 2.])

#section[D. The double helix story and the scientific method]
Write the correct step next to each event: *observation · data collection · hypothesis · revising the hypothesis · testing a prediction · communicating the conclusion*

#let ev(l, s, a) = {
  grid(columns: (1.2em, 1fr, 5.2cm), gutter: 6pt, [*#l.*], s, ans(a))
  v(0.45em)
}
#ev("a")[Chargaff notices that A ≈ T and G ≈ C in the DNA of every species.][observation]
#ev("b")[Franklin and Gosling take X-ray photographs of DNA (Photo 51).][data collection]
#ev("c")[Watson and Crick propose a model of the structure of DNA.][hypothesis]
#ev("d")[Their first model is shown to be wrong, so they build a new one.][revising the hypothesis]
#ev("e")[The double helix model is published in _Nature_ in 1953.][communicating the conclusion]
#ev("f")[In 1958 Meselson and Stahl check whether each new DNA molecule keeps one old strand.][testing a prediction]
