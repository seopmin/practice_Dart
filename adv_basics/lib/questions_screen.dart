import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.chooseAnswer, super.key});

  final void Function(String answer) chooseAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void nextQuestion(String e) {
    widget.chooseAnswer(e);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(conetxt) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch, // 수평으로 늘리기
              children: [
                Text(
                  currentQuestion.text,
                  style: GoogleFonts.nunitoSans(
                      color: const Color.fromARGB(255, 216, 150, 255),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                // map으로 반환하여도 리스트로 남기 때문에 spread 연산자를 사용해야함.
                ...currentQuestion.getShuffledAnswers().map((e) {
                  return AnswerButton(e, nextQuestion);
                })
                // SizedBox(height: 20),
                // AnswerButton("Answer 1", nextQuestion),
                // SizedBox(height: 20),
                // AnswerButton("Answer 2", nextQuestion),
                // SizedBox(height: 20),
                // AnswerButton("Answer 3", nextQuestion),
              ],
            )));
  }
}
