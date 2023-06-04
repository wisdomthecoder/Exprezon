class FAQ {
  String question, questionType, answer;
  bool isExpanded;
  FAQ({
    required this.question,
    required this.questionType,
    this.isExpanded = false,
    required this.answer,
  });
}

List<FAQ> faqs = [
  FAQ(
    question: 'Issue regarding sign in Sign Up, Verification, etc',
    questionType: 'Sign in Issue',
    answer:
        'The Answer is here and for the question because The Answer is here and for the question because The Answer is here and for the question because The Answer is here and for the question because',
  ),
  FAQ(
    question: 'Any Isuue regarding booking a ride',
    questionType: 'Ride Booking',
    answer:
        'The Answer is here and for the question because The Answer is here and for the question because The Answer is here and for the question because The Answer is here and for the question because',
  ),
  FAQ(
    question: 'Problem while payment via wallet',
    questionType: 'Payment ',
    answer:
        'The Answer is here and for the question because The Answer is here and for the question because The Answer is here and for the question because The Answer is here and for the question because',
  ),
  FAQ(
    question: 'Map loading issue, route issue, location picker...',
    questionType: 'Map Loading',
    answer:
        'The Answer is here and for the question because The Answer is here and for the question because The Answer is here and for the question because The Answer is here and for the question because',
  ),
  FAQ(
    question: 'Report Misbehave Driver, block Driver.',
    questionType: 'Sign in Issue',
    answer:
        'The Answer is here and for the question because The Answer is here and for the question because The Answer is here and for the question because The Answer is here and for the question because',
  ),
  FAQ(
    question: 'Wrong information provided Fake Driver',
    questionType: 'Other Issue',
    answer:
        'The Answer is here and for the question because The Answer is here and for the question because The Answer is here and for the question because The Answer is here and for the question because',
  ),
];
