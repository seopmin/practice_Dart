import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.switchScreen, this.correctCnt, this.chosenAnswer,
      {super.key});

  final void Function(int i) switchScreen;
  final List<String> chosenAnswer;
  final int correctCnt;

  int getCorrectCnt() {
    var cnt = 0;
    for (var i = 0; i < chosenAnswer.length; i++) {
      if (chosenAnswer[i] == questions[i].answers[0]) cnt++;
    }
    return cnt;
  }

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> sumary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      sumary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i]
      });
    }

    return sumary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final correctCnt = getCorrectCnt();

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Your answered $correctCnt out of ${chosenAnswer.length} questions corretly!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              QuestionsSummary(summaryData: summaryData),
              OutlinedButton(
                  onPressed: () {
                    switchScreen(0);
                  },
                  child: Text("Restart button"))
            ]),
      ),
    );
  }
}
