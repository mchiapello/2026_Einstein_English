/**
 * Creates the Google Form quiz "Understanding DNA — Review Quiz" (Session 3).
 * Shown at the start of Session 4.
 * Paste into https://script.google.com (New project), then Run > createQuiz.
 * The form URLs are printed in the Execution log.
 */
function createQuiz() {
  const form = FormApp.create('Understanding DNA — Review Quiz')
    .setDescription('Session 3 review. 10 questions, one correct answer each.')
    .setIsQuiz(true)
    .setCollectEmail(false)
    .setShuffleQuestions(false);

  const questions = [
    {
      q: 'What are the three parts of a nucleotide?',
      options: [
        'A phosphate group, a sugar and a base',
        'A protein, a sugar and a base',
        'A phosphate group, a histone and a base',
        'Two bases and a hydrogen bond'
      ],
      correct: 0,
      feedback: 'Phosphate + sugar (deoxyribose) + base. The phosphate and the sugar are always the same: only the base changes.'
    },
    {
      q: 'What does "deoxy" mean in deoxyribonucleic acid?',
      options: [
        'The molecule is found in the nucleus',
        'The sugar has one oxygen atom less than ribose',
        'The molecule carries oxygen around the body',
        'The molecule is an acid'
      ],
      correct: 1,
      feedback: '"De-oxy" = without oxygen: deoxyribose has just an H on carbon 2\', where ribose has an OH.'
    },
    {
      q: 'Which is the base-pairing rule in DNA?',
      options: [
        'A pairs with G, and T pairs with C',
        'A pairs with C, and G pairs with T',
        'A pairs with T, and G pairs with C',
        'Any base can pair with any other base'
      ],
      correct: 2,
      feedback: 'A–T (2 hydrogen bonds) and G–C (3 hydrogen bonds). A purine always pairs with a pyrimidine, so every rung has the same width.'
    },
    {
      q: 'One DNA strand reads A T G C C A. What does the complementary strand read?',
      options: [
        'A T G C C A',
        'T A C G G T',
        'U A C G G U',
        'G C A T T G'
      ],
      correct: 1,
      feedback: 'Swap every letter using the pairing rule: A→T, T→A, G→C, C→G. (U is found in RNA, not in DNA.)'
    },
    {
      q: 'In the double helix, where are the bases?',
      options: [
        'On the outside, forming the two sides of the ladder',
        'Floating freely around the helix',
        'Only at the two ends of the molecule',
        'On the inside, as the rungs of the ladder'
      ],
      correct: 3,
      feedback: 'The sugar-phosphate backbone is on the outside; the base pairs, which carry the information, are inside, where they are protected.'
    },
    {
      q: 'How does DNA replication work?',
      options: [
        'The helix unzips and each old strand is a template for a new strand',
        'The cell builds a completely new helix and keeps the old one intact',
        'The DNA is cut in half and each half is given to one new cell',
        'Proteins copy the DNA by reading it from the RNA'
      ],
      correct: 0,
      feedback: 'Semi-conservative replication: each new DNA molecule keeps one old strand and gets one new strand.'
    },
    {
      q: 'What is a gene?',
      options: [
        'The complete set of DNA of an organism',
        'A protein that packs DNA into chromosomes',
        'A stretch of DNA with the instructions for one product, usually a protein',
        'A single base pair'
      ],
      correct: 2,
      feedback: 'Cookbook analogy: genome = the whole cookbook, chromosome = a chapter, gene = a recipe, protein = the dish.'
    },
    {
      q: 'About how many base pairs are in the human genome?',
      options: [
        '3 million',
        '30 million',
        '3 trillion',
        '3 billion'
      ],
      correct: 3,
      feedback: 'About 3 billion base pairs, but only about 1.5% of them code for proteins (about 20,000 genes).'
    },
    {
      q: 'Which statement about mutations is correct?',
      options: [
        'Mutations are always harmful',
        'A mutation can be harmful, neutral or beneficial',
        'Mutations only happen in people who are ill',
        'A mutation changes a protein into DNA'
      ],
      correct: 1,
      feedback: 'Most mutations are neutral. The sickle-cell mutation causes a disease with two copies, but one copy protects against malaria.'
    },
    {
      q: 'What was Rosalind Franklin\'s contribution to the discovery of the double helix?',
      options: [
        'She built the first metal model of DNA',
        'She measured that A ≈ T and G ≈ C in many species',
        'Her X-ray images, such as Photo 51, showed that DNA is a helix',
        'She proved that DNA is copied in a semi-conservative way'
      ],
      correct: 2,
      feedback: 'Photo 51 (1952) showed the helix and its size. Chargaff measured the bases, Watson and Crick built the model, and Meselson and Stahl tested replication.'
    }
  ];

  questions.forEach(function (item) {
    const mc = form.addMultipleChoiceItem()
      .setTitle(item.q)
      .setPoints(1)
      .setRequired(true);
    mc.setChoices(item.options.map(function (text, i) {
      return mc.createChoice(text, i === item.correct);
    }));
    const fb = FormApp.createFeedback().setText(item.feedback).build();
    mc.setFeedbackForCorrect(fb);
    mc.setFeedbackForIncorrect(fb);
  });

  Logger.log('Edit URL:      ' + form.getEditUrl());
  Logger.log('Student URL:   ' + form.getPublishedUrl());
  Logger.log('Short URL:     ' + form.shortenFormUrl(form.getPublishedUrl()));
}
