import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  static const _questions = [
    {
      'questionText': 'Would you kindly hire me?',
      'answers': ['Yes', 'Sure', 'Of course, my horse!', 'Yes, master'],
    },
    {
      'questionText': 'Hiring me would be a ____',
      'answers': [
        'Wise decision',
        'Smart move',
        'The right thing to do',
        'Yes, master'
      ],
    },
    {
      'questionText': 'Is this getting awkward? (I desperatly need a job)',
      'answers': [
        'No probs, champs!',
        'Chillax, dude!',
        'Take a chill pill!',
        'No, master'
      ],
    },
    {
      'questionText': 'Ablablublublebluelbluè',
      'answers': [
        'blablublbublu',
        'abububluè',
        'babluablublublub',
      ],
    },
  ];

  void _optionPressed() {
    // IMPORTANT for undestanding flutter flow:
    //    setState re-calls the build method of this state

    setState(() {
      _questionIndex++;
    });
    print('you chose... poorly');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('One App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
              index: _questionIndex,
              pressed: _optionPressed,
              questions: _questions,
            )
            : Center(
                child: Text(
                  'You get a Job!',
                  style: TextStyle(fontSize: 28.0),
                ),
              ),
      ),
    );
  }
}

class ClassSkeleton {
  String name;
  int totalBones;

  ClassSkeleton({this.name = 'anonymous', @required this.totalBones});
}
