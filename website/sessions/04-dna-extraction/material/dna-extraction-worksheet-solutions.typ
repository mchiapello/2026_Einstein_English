// Session 4 worksheet — ANSWER KEY (teacher copy). Build the PDF with:
//   quarto typst compile dna-extraction-worksheet-solutions.typ
// Same layout as dna-extraction-worksheet.typ, with the answers filled in red.

#set page(paper: "a4", margin: (x: 2cm, y: 1.8cm),
  footer: align(center, text(8pt, fill: gray)[Scientific English — Liceo Einstein · Session 4: DNA Extraction · Answer key]))
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
  #text(18pt, weight: "bold", fill: blue)[DNA Extraction Lab — Answer Key] \
  #text(11pt)[Classroom worksheet — Session 4 · Teacher copy]
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
#tf(1, false)[Soap is used to break the cell wall.][Soap dissolves the *membranes* (cell membrane and nuclear membrane). The cell wall is broken by *grinding*.]
#tf(2, true)[Salt helps to pull the proteins away from the DNA.][Correct as written. (Salt also neutralises the negative charges of DNA, so the strands can clump together.)]
#tf(3, false)[DNA dissolves easily in ethanol.][DNA dissolves in *water* but *not in ethanol*: that is why it precipitates when we add ethanol.]
#tf(4, true)[The liquid that passes through a filter is called the filtrate.][Correct as written. (The solids left in the filter are the residue.)]
#tf(5, false)[The white strands in the tube are a single DNA molecule.][They are *millions of DNA molecules* clumped together. One double helix is only 2 nm wide, far too thin to see.]

#section[B. Matching]
Write the letter of the correct definition next to each term.

#grid(columns: (3.6cm, 1.4cm, 1fr), row-gutter: 9pt, column-gutter: 6pt,
  [1. extraction solution], ans[h], [*a.* a set of written instructions for an experiment, step by step],
  [2. detergent], ans[e], [*b.* the solid pieces left in a filter],
  [3. filtrate], ans[g], [*c.* a bowl in which a sample is ground with a pestle],
  [4. residue], ans[b], [*d.* breaking open cells],
  [5. precipitation], ans[f], [*e.* a substance, like soap, that dissolves fats and membranes],
  [6. lysis], ans[d], [*f.* when a dissolved substance comes out of a solution as a solid],
  [7. mortar], ans[c], [*g.* the liquid that passes through a filter],
  [8. protocol], ans[a], [*h.* a mixture of water, salt and soap used to break open cells],
)

#section[C. The language of protocols]
Protocols use the *imperative*: they start with the verb. Rewrite each sentence as an instruction.

#let rw(n, s, a) = {
  block(below: 0.3em)[*#n.* #s]
  pad(left: 1.2em, ans(a))
  v(0.3em)
}
#rw("a")[You have to stir the solution gently.][Stir the solution gently.]
#rw("b")[The filter with the solid pieces should be thrown away.][Throw away (discard) the filter with the solid pieces.]
#rw("c")[Then the tube is left still for two minutes.][Leave the tube still for two minutes. / Wait two minutes.]

#pagebreak()
#section[D. The order of the protocol]
The steps are mixed up. Number them from *1* to *8* in the correct order.

#let order(n, s) = {
  grid(columns: (1.6cm, 1fr), gutter: 6pt,
    box(width: 1.1cm, height: 1.3em, stroke: 0.6pt + gray, align(center + horizon, ans(str(n)))), s)
  v(0.1em)
}
#order(5)[Filter the mixture and collect the filtrate.]
#order(2)[Weigh the fruit.]
#order(7)[Pour 8 ml of ice-cold ethanol slowly down the side of the tube.]
#order(1)[Mix water, salt and washing-up liquid to make the extraction solution.]
#order(8)[Observe the white strands that appear between the two liquids.]
#order(3)[Grind the fruit in a mortar.]
#order(6)[Transfer about 3 ml of filtrate into a clean tube.]
#order(4)[Add the extraction solution to the fruit and mix gently.]

#section[E. Your experiment: banana or strawberry?]
*1.* Write your hypothesis.

#pad(left: 1.2em, ans[Any testable hypothesis in the form "If …, then …, because …". Example: If we use strawberries, then we will see more DNA than with banana, because strawberries are softer and easier to break.])

*2.* Identify the variables of the experiment.

#grid(columns: (4.6cm, 1fr), row-gutter: 10pt,
  [Independent variable:], ans[the type of fruit (banana or strawberry)],
  [Dependent variable:], ans[the amount of DNA we see],
  [Two controlled variables:], ans[any two of: mass of fruit, volume of extraction solution, volume of filtrate, volume and temperature of ethanol, waiting time],
)

*3.* Record your results.

#pad(left: 1.2em, ans[Results vary. Usually the strawberry gives much more DNA: a thick white cloud of strands. The banana gives less, thinner strands.])

*4.* Was your hypothesis supported? Which fruit gave more DNA, and why do you think so?

#pad(left: 1.2em, ans[Strawberries usually give more DNA. Their cells have 8 copies of each chromosome (bananas have 3), and the soft fruit is easy to break open. Accept any answer that compares the result with the hypothesis and gives a reason.])
