import 'package:adv_basics/questions_screen.dart';
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
  Widget? activeScreen;
  var activeScreen2 = 'start-screen';

  @override
  void initState() {
    // TODO: implement initState
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen2 = 'quiz-screen';
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(context) {
    Widget currentScreen = StartScreen(switchScreen);

    if (activeScreen2 != 'start-screen') {
      currentScreen = const QuestionsScreen();
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
