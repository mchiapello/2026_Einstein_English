/**
 * Creates the Google Form quiz "How to Study — Review Quiz" (Session 1).
 * Paste into https://script.google.com (New project), then Run > createQuiz.
 * The form URLs are printed in the Execution log.
 */
function createQuiz() {
  const form = FormApp.create('How to Study — Review Quiz')
    .setDescription('Session 1 review. 10 questions, one correct answer each.')
    .setIsQuiz(true)
    .setCollectEmail(false)
    .setShuffleQuestions(false);

  const questions = [
    {
      q: 'Which statement about multitasking is correct?',
      options: [
        'The brain can focus on two tasks at the same time if they are easy',
        'We actually switch quickly between tasks, and attention is on one task at a time',
        'Multitasking improves learning because it keeps the brain active',
        'Listening to music while studying is real multitasking'
      ],
      correct: 1,
      feedback: 'Multitasking is a myth: we switch between tasks, and every switch costs time and attention.'
    },
    {
      q: 'Why is five hours of study spread over two weeks better than five hours in one night?',
      options: [
        'Because you get less tired',
        'Because forgetting a little and then retrieving the memory makes it stronger',
        'Because the teacher can check your progress',
        'It is not better, the total time is the same'
      ],
      correct: 1,
      feedback: 'This is spaced practice: retrieving something you have partly forgotten strengthens the memory.'
    },
    {
      q: 'What is retrieval practice?',
      options: [
        'Reading your notes again and again',
        'Highlighting the most important sentences in the book',
        'Bringing information to mind from memory, for example writing everything you know with the book closed',
        "Copying the teacher's slides into your notebook"
      ],
      correct: 2,
      feedback: 'Retrieval means pulling information out of your memory, not putting it in again.'
    },
    {
      q: 'Why does re-reading your notes give weaker learning than retrieval practice?',
      options: [
        'Because it feels familiar, so you think you know it, but you are not recalling anything',
        'Because notes always contain mistakes',
        'Because re-reading takes too much time',
        'Re-reading gives better learning than retrieval practice'
      ],
      correct: 0,
      feedback: 'Re-reading builds confidence but not much learning. Feeling that something is familiar is not the same as knowing it.'
    },
    {
      q: 'What does interleaving mean?',
      options: [
        'Studying one topic until it is finished, then moving to the next',
        'Switching between different topics or types of problems in the same study session',
        'Studying with a classmate',
        'Taking a break every 25 minutes'
      ],
      correct: 1,
      feedback: 'Study A, then B, then C, and later mix the order again. But do not switch too often: you need time to understand each idea.'
    },
    {
      q: 'Dual coding means…',
      options: [
        'studying the same topic twice',
        'combining words and visuals, such as diagrams or timelines, to represent the same information',
        'taking notes in two different colours',
        'studying in two languages'
      ],
      correct: 1,
      feedback: 'Words plus visuals give you two ways to retrieve the same idea.'
    },
    {
      q: 'Which activity is an example of elaboration?',
      options: [
        'Reading the chapter a third time',
        'Asking yourself how and why something works and connecting it to what you already know',
        'Memorising a definition word for word',
        'Studying with the TV on'
      ],
      correct: 1,
      feedback: 'Elaboration means explaining ideas in detail, asking how and why, and linking them to your own experience.'
    },
    {
      q: 'In the Cornell method, what goes in the cue column (left)?',
      options: [
        "A copy of the teacher's slides",
        'Questions and keywords, written after class',
        'The summary of the page',
        'Drawings only'
      ],
      correct: 1,
      feedback: 'The cue column holds questions you answer from memory while covering the notes column: that is retrieval practice.'
    },
    {
      q: 'What is the Pomodoro technique?',
      options: [
        'Studying all afternoon without breaks',
        'Studying in focused blocks of about 25 minutes, separated by short breaks',
        'Eating fruit while studying',
        'Studying only in the morning'
      ],
      correct: 1,
      feedback: '"Pomodoro" means tomato in Italian: the original timer was shaped like a tomato.'
    },
    {
      q: 'Which is the best way to use an AI tool like NotebookLM for studying?',
      options: [
        '"Write my essay on DNA"',
        '"Summarise the chapter so I don\'t have to read it"',
        '"Quiz me on this chapter, one question at a time, and wait for my answer"',
        '"Give me all the answers to the homework"'
      ],
      correct: 2,
      feedback: 'The AI should be your study partner, not the author: the thinking has to happen in your head.'
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
