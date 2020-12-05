import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  // GETTERS always have to return the declared data type
  String get resultPhrase {
    var tmpStr = 'You get a job!';
    if (resultScore <= 1030) {
      tmpStr = 'You have $resultScore reasons to get a job';
    } else if (resultScore <= 2100) {
      tmpStr = 'You have to send $resultScore CVs to get a job';
    } else {
      tmpStr = 'You did it! You lucky bastard!';
    }

    return tmpStr;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(15.0),
            child: Text(
              resultPhrase,
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: FlatButton(
              child: Icon(
                Icons.replay_circle_filled, 
                color: Colors.blue,
                size: 100.0,
              ),
              color: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: resetQuiz,
            ),
          ),
        ],
      ),
    );
  }
}
