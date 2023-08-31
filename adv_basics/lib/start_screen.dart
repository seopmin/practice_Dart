import 'dart:ui';

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function(int i) switchScreen;

  void clickHandler() {
    switchScreen(1);
  }

  @override
  Widget build(context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        'assets/images/quiz-logo.png',
        width: 300,
        color: Color.fromARGB(143, 255, 255, 255),
      ),
      const SizedBox(
        height: 100,
      ),
      const Text("Learn Flutter the fun way!",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          )),
      const SizedBox(
        height: 50,
      ),
      OutlinedButton.icon(
        onPressed: clickHandler,
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            foregroundColor: Colors.white,
            backgroundColor: Colors.amber),
        icon: Icon(Icons.arrow_forward_ios, size: 10),
        label: const Text("Start Quiz"),
      )
    ]));
  }
}
