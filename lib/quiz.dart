import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int index;
  final Function pressed;

  Quiz({
    @required this.questions, 
    @required this.index, 
    @required this.pressed
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[index]['questionText'],
        ),
        ...(questions[index]['answers'] as List<String>).map((e) {
          return Answer(pressed, e);
        }).toList(),
      ],
    );
  }
}
