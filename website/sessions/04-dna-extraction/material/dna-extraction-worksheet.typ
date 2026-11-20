// Session 4 worksheet. Build the PDF with:
//   quarto typst compile dna-extraction-worksheet.typ
// The answer key is dna-extraction-worksheet-solutions.typ (teacher copy, not published).

#set page(paper: "a4", margin: (x: 2cm, y: 1.8cm),
  footer: align(center, text(8pt, fill: gray)[Scientific English — Liceo Einstein · Session 4: DNA Extraction]))
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
  #text(18pt, weight: "bold", fill: blue)[DNA Extraction Lab] \
  #text(11pt)[Classroom worksheet — Session 4]
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
#tf(1)[Soap is used to break the cell wall.]
#tf(2)[Salt helps to pull the proteins away from the DNA.]
#tf(3)[DNA dissolves easily in ethanol.]
#tf(4)[The liquid that passes through a filter is called the filtrate.]
#tf(5)[The white strands in the tube are a single DNA molecule.]

#section[B. Matching]
Write the letter of the correct definition next to each term.

#grid(columns: (3.6cm, 1.4cm, 1fr), row-gutter: 9pt, column-gutter: 6pt,
  [1. extraction solution], [\_\_\_\_], [*a.* a set of written instructions for an experiment, step by step],
  [2. detergent], [\_\_\_\_], [*b.* the solid pieces left in a filter],
  [3. filtrate], [\_\_\_\_], [*c.* a bowl in which a sample is ground with a pestle],
  [4. residue], [\_\_\_\_], [*d.* breaking open cells],
  [5. precipitation], [\_\_\_\_], [*e.* a substance, like soap, that dissolves fats and membranes],
  [6. lysis], [\_\_\_\_], [*f.* when a dissolved substance comes out of a solution as a solid],
  [7. mortar], [\_\_\_\_], [*g.* the liquid that passes through a filter],
  [8. protocol], [\_\_\_\_], [*h.* a mixture of water, salt and soap used to break open cells],
)

#section[C. The language of protocols]
Protocols use the *imperative*: they start with the verb. Rewrite each sentence as an instruction.

#let rw(n, s) = {
  block(below: 0.3em)[*#n.* #s]
  pad(left: 1.2em, line-space)
  v(0.3em)
}
#rw("a")[You have to stir the solution gently.]
#rw("b")[The filter with the solid pieces should be thrown away.]
#rw("c")[Then the tube is left still for two minutes.]

#pagebreak()
#section[D. The order of the protocol]
The steps are mixed up. Number them from *1* to *8* in the correct order.

#let order(s) = {
  grid(columns: (1.6cm, 1fr), gutter: 6pt, box(width: 1.1cm, height: 1.3em, stroke: 0.6pt + gray), s)
  v(0.1em)
}
#order[Filter the mixture and collect the filtrate.]
#order[Weigh the fruit.]
#order[Pour 8 ml of ice-cold ethanol slowly down the side of the tube.]
#order[Mix water, salt and washing-up liquid to make the extraction solution.]
#order[Observe the white strands that appear between the two liquids.]
#order[Grind the fruit in a mortar.]
#order[Transfer about 3 ml of filtrate into a clean tube.]
#order[Add the extraction solution to the fruit and mix gently.]

#section[E. Your experiment: banana or strawberry?]
*1.* Write your hypothesis. #h(0.5em) _If we use …, then …, because …_

#line-space \
#line-space

*2.* Identify the variables of the experiment.

#grid(columns: (4.6cm, 1fr), row-gutter: 10pt,
  [Independent variable:], line-space,
  [Dependent variable:], line-space,
  [Two controlled variables:], line-space,
)

*3.* Record your results.

#table(columns: (3.2cm, 2.4cm, 1fr), inset: 7pt, stroke: 0.6pt + gray,
  table.header([*Fruit*], [*Mass (g)*], [*What do you see? (amount, colour, texture)*]),
  [Banana], [], [#v(1.4em)],
  [Strawberry], [], [#v(1.4em)],
)

*4.* Was your hypothesis supported? Which fruit gave more DNA, and why do you think so?

#line-space \
#line-space \
#line-space
