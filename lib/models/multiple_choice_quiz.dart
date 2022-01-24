class MultipleChoiceQuiz {
  final String question;
  final Map<String, bool> options;

  const MultipleChoiceQuiz({
    required this.question,
    required this.options
  });

  factory MultipleChoiceQuiz.fromJson(Map<String, dynamic> json) {
    return new MultipleChoiceQuiz(
      question: json['question'],
      options: Map.from(json['options']),
    );
  }
}