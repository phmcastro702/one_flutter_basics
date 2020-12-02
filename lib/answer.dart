import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';


class Answer extends StatelessWidget {

  final Function onPressedFunk;
  final String answerText;

  Answer(this.onPressedFunk, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        width: double.infinity,
        child: RaisedButton(
          textColor: Colors.white,
          color: RandomColor().randomColor(colorBrightness: ColorBrightness.dark),
          child: Text(
            answerText,
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          onPressed: onPressedFunk,
        ),
      ),
    );
  }
}