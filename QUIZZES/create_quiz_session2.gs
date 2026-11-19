/**
 * Creates the Google Form quiz "Scientific Method — Review Quiz" (Session 2).
 * Shown at the start of Session 3.
 * Paste into https://script.google.com (New project), then Run > createQuiz.
 * The form URLs are printed in the Execution log.
 */
function createQuiz() {
  const form = FormApp.create('Scientific Method — Review Quiz')
    .setDescription('Session 2 review. 10 questions, one correct answer each.')
    .setIsQuiz(true)
    .setCollectEmail(false)
    .setShuffleQuestions(false);

  const questions = [
    {
      q: 'What is the correct order of the first four steps of the scientific method?',
      options: [
        'Hypothesis → observation → experiment → question',
        'Observation → question → hypothesis → experiment',
        'Question → experiment → observation → hypothesis',
        'Experiment → hypothesis → question → observation'
      ],
      correct: 1,
      feedback: 'Observation → question → hypothesis → experiment → data collection → data analysis → conclusion. And it is a cycle, not a line.'
    },
    {
      q: 'Which of these is a falsifiable hypothesis?',
      options: [
        'Plants have feelings that no instrument can detect',
        'If bean plants get more light, they will grow taller in two weeks',
        'Do plants like light?',
        'Plants are beautiful'
      ],
      correct: 1,
      feedback: 'A falsifiable hypothesis can be proven wrong by evidence. "If… then…" statements with something measurable work well.'
    },
    {
      q: 'A student gives plants different amounts of fertilizer and measures their height. What is the independent variable?',
      options: [
        'The amount of fertilizer',
        'The height of the plants',
        'The type of pot',
        'The number of plants'
      ],
      correct: 0,
      feedback: 'The independent variable is the one the experimenter deliberately changes.'
    },
    {
      q: 'In the same experiment, what is the dependent variable?',
      options: [
        'The amount of fertilizer',
        'The height of the plants',
        'The amount of water',
        'The control group'
      ],
      correct: 1,
      feedback: 'The dependent variable is the one we measure.'
    },
    {
      q: 'What is the purpose of a control group?',
      options: [
        'To receive a double dose of the treatment',
        'To give a baseline for comparison, without the treatment',
        'To make the experiment faster',
        'To prove that the hypothesis is right'
      ],
      correct: 1,
      feedback: 'The control group is identical except that it does not get the treatment, so any difference can be linked to the treatment.'
    },
    {
      q: 'A scale always reads exactly 2 kg too high. Its measurements are:',
      options: [
        'Precise but not accurate',
        'Accurate but not precise',
        'Both precise and accurate',
        'Neither precise nor accurate'
      ],
      correct: 0,
      feedback: 'Consistent results = precise. Far from the true value = not accurate. This is a systematic error.'
    },
    {
      q: 'Ice cream sales and shark attacks rise and fall together. What is the best explanation?',
      options: [
        'Eating ice cream attracts sharks',
        'Shark attacks make people buy ice cream',
        'A third factor, hot weather, causes both',
        'It is pure chance and means nothing'
      ],
      correct: 2,
      feedback: 'Correlation is not causation: hot weather makes people buy ice cream AND swim in the sea.'
    },
    {
      q: 'Hypothesis: "Studying with flashcards improves exam scores". What is the null hypothesis (H₀)?',
      options: [
        'Flashcards improve exam scores a lot',
        'Flashcards have no effect on exam scores',
        'Flashcards make exam scores worse',
        'Students who use flashcards study more'
      ],
      correct: 1,
      feedback: 'The null hypothesis is the claim of no effect. An experiment gathers evidence to reject it.'
    },
    {
      q: 'Why do scientists assign subjects to groups at random (randomization)?',
      options: [
        'To make the experiment shorter',
        'To get more data',
        'To avoid bias in who receives the treatment',
        'To be sure the hypothesis is supported'
      ],
      correct: 2,
      feedback: 'Randomization stops, for example, all the most motivated students from ending up in the same group.'
    },
    {
      q: 'What did Fleming observe in 1928 that started the discovery of penicillin?',
      options: [
        'A mould that grew faster near bacteria',
        'A clear zone with no bacteria around a mould on a petri dish',
        'Bacteria that changed colour in the dark',
        'A patient who recovered after eating mould'
      ],
      correct: 1,
      feedback: 'An unexpected observation, plus curiosity about WHY the bacteria had died.'
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
