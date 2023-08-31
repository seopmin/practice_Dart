import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswer = [];
  Widget? activeScreen;
  var activeScreen2 = 'start-screen';

  @override
  void initState() {
    // TODO: implement initState
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen(int i) {
    setState(() {
      if (i == 0) {
        activeScreen2 = 'start-screen';
        selectedAnswer.clear();
        print("selectedAnswer is cleared");
      } else {
        activeScreen2 = 'quiz-screen';
      }
      // activeScreen = const QuestionsScreen();
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen2 = 'next-screen';
      });
    }
    print(selectedAnswer);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(context) {
    Widget currentScreen = StartScreen(switchScreen);

    if (activeScreen2 == 'quiz-screen') {
      currentScreen = QuestionsScreen(chooseAnswer: chooseAnswer);
    } else if (activeScreen2 == 'next-screen') {
      currentScreen = ResultScreen(switchScreen, 2, selectedAnswer);
    }

    return MaterialApp(
        home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.purple, Color.fromARGB(255, 68, 0, 80)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: currentScreen),
    ));
  }
}
