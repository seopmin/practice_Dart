import 'package:flutter/material.dart';

void clickHandler() {}

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: const Color.fromARGB(255, 90, 18, 124),
    body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        'assets/images/quiz-logo.png',
        width: 200,
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
      TextButton(
        onPressed: clickHandler,
        style: TextButton.styleFrom(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            foregroundColor: Colors.white),
        child: Text("Start Quiz"),
      )
    ])),
  )));
}
