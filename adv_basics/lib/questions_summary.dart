import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map(
              (data) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: data['user_answer'].toString() ==
                                    data['correct_answer'].toString()
                                ? Colors.blue
                                : Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                            ((data['question_index'] as int) + 1).toString())),
                    Expanded(
                        child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(data['question'] as String),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
