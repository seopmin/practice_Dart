import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answer, this.nextQuestion, {super.key});
  final String answer;
  final void Function(String s) nextQuestion;

  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: ElevatedButton(
        onPressed: () {
          nextQuestion(answer);
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            backgroundColor: const Color.fromARGB(255, 78, 8, 90),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          answer,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
