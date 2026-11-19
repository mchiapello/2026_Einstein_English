// Session 3 worksheet. Build the PDF with:
//   quarto typst compile dna-worksheet.typ
// The answer key is in the speaker notes of the last slide (slides.qmd).

#set page(paper: "a4", margin: (x: 2cm, y: 1.8cm),
  footer: align(center, text(8pt, fill: gray)[Scientific English — Liceo Einstein · Session 3: Understanding DNA]))
#set text(font: ("Helvetica", "Arial"), size: 10.5pt)
#set par(justify: false, leading: 0.6em)
#let blue = rgb("#1d5c9c")
#let line-space = box(width: 1fr, repeat[.])
#let section(title) = {
  v(0.8em)
  block(fill: blue, inset: (x: 8pt, y: 5pt), radius: 3pt, width: 100%,
    text(fill: white, weight: "bold", size: 12pt, title))
  v(0.3em)
}

#align(center)[
  #text(18pt, weight: "bold", fill: blue)[Exploring DNA] \
  #text(11pt)[Classroom worksheet — Session 3]
]
#v(0.4em)
Name: #box(width: 6cm, repeat[\_]) #h(1fr) Class: #box(width: 2cm, repeat[\_]) #h(1fr) Date: #box(width: 3cm, repeat[\_])

#section[A. True or False]
Circle *T* (true) or *F* (false). If a statement is false, rewrite it so that it is true.

#let tf(n, s) = {
  grid(columns: (1.2em, 1fr, 3.2em), gutter: 6pt, [*#n.*], s, [*T* #h(4pt) *F*])
  v(0.15em)
  pad(left: 1.2em, line-space)
  v(0.35em)
}
#tf(1)[The double helix structure of DNA was discovered in 1869.]
#tf(2)[A nucleotide is made of a phosphate group, a sugar and a nitrogenous base.]
#tf(3)[In DNA, adenine (A) always pairs with guanine (G).]
#tf(4)[Most mutations are harmful.]
#tf(5)[Most human cells contain 23 chromosomes.]

#section[B. Matching]
Write the letter of the correct definition next to each term.

#grid(columns: (3.2cm, 1.4cm, 1fr), row-gutter: 9pt, column-gutter: 6pt,
  [1. nucleotide], [\_\_\_\_], [*a.* the complete set of DNA of an organism],
  [2. gene], [\_\_\_\_], [*b.* two bases joined by hydrogen bonds, such as A–T],
  [3. genome], [\_\_\_\_], [*c.* the process that copies DNA before a cell divides],
  [4. chromosome], [\_\_\_\_], [*d.* the building block of DNA: phosphate + sugar + base],
  [5. base pair], [\_\_\_\_], [*e.* a protein that DNA is wound around, like thread on a spool],
  [6. mutation], [\_\_\_\_], [*f.* a stretch of DNA with the instructions for one product, usually a protein],
  [7. replication], [\_\_\_\_], [*g.* a change in the DNA sequence],
  [8. histone], [\_\_\_\_], [*h.* a tightly packed structure of DNA and proteins; humans have 46],
)

#pagebreak()
#section[C. Complementary strands]
#let strand(s) = text(font: ("Menlo", "Courier New"), size: 13pt, weight: "bold", tracking: 3pt, s)
#let boxes(n) = for i in range(n) { box(width: 1.25em, height: 1.4em, stroke: 0.6pt + gray) + h(3pt) }

*1.* Write the complementary strand. #h(1fr) #strand[TTAGCCATGC] \
#h(1fr) #boxes(10)

*2.* Write the complementary strand. #h(1fr) #strand[CGAATTCGTA] \
#h(1fr) #boxes(10)

*3.* A DNA sample contains *30 % adenine*. Use the base-pairing rule (Chargaff's rules) to find the percentage of the other bases.

#h(2em) T = \_\_\_\_\_ % #h(3em) G = \_\_\_\_\_ % #h(3em) C = \_\_\_\_\_ %

*4.* Which DNA is harder to separate into two strands: DNA rich in *A–T* pairs, or DNA rich in *G–C* pairs? Explain why.

#line-space \
#line-space

#section[D. The double helix story and the scientific method]
Write the correct step next to each event: *observation · data collection · hypothesis · revising the hypothesis · testing a prediction · communicating the conclusion*

#let ev(l, s) = {
  grid(columns: (1.2em, 1fr, 5.2cm), gutter: 6pt, [*#l.*], s, box(width: 100%, repeat[.]))
  v(0.45em)
}
#ev("a")[Chargaff notices that A ≈ T and G ≈ C in the DNA of every species.]
#ev("b")[Franklin and Gosling take X-ray photographs of DNA (Photo 51).]
#ev("c")[Watson and Crick propose a model of the structure of DNA.]
#ev("d")[Their first model is shown to be wrong, so they build a new one.]
#ev("e")[The double helix model is published in _Nature_ in 1953.]
#ev("f")[In 1958 Meselson and Stahl check whether each new DNA molecule keeps one old strand.]
