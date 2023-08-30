class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // list를 복사하고 싶을 때 List.of 를 이용하여 새로운 리스트 반환
    final List<String> copy_answers = List.of(answers);
    copy_answers.shuffle();
    return copy_answers;
  }
}
