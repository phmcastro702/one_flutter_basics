import 'package:flutter/material.dart';
import 'package:one_flutter_basics/result.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';
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
      'answers': [
        {'text': 'Yes', 'score': 5},
        {'text': 'Sure', 'score': 10},
        {'text': 'Of course, my horse!', 'score': 20},
        {'text': 'Yes, master', 'score': 30}
      ],
    },
    {
      'questionText': 'Hiring me would be a ____',
      'answers': [
        {'text': 'Wise decision', 'score': 5},
        {'text': 'Smart move', 'score': 10},
        {'text': 'The right thing to do', 'score': 15},
        {'text': 'Yes, master', 'score': 30}
      ],
    },
    {
      'questionText': 'Is this getting awkward? (I desperatly need a job)',
      'answers': [
        {'text': 'No probs, champs!', 'score': 5},
        {'text': 'Chillax, dude!', 'score': 10},
        {'text': 'Take a chill pill!', 'score': 20},
        {'text': 'No, master', 'score': 30}
      ],
    },
    {
      'questionText': 'Ablablublublebluelbluè',
      'answers': [
        {'text': 'blablublbublu', 'score': 1000},
        {'text': 'abububluè', 'score': 2000},
        {'text': 'babluablublublub', 'score': 3000},
      ],
    },
  ];

  var _totalScore = 0;

  void _resetQuiz()
  {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _optionPressed(int score) {
    // IMPORTANT for undestanding flutter flow:
    //    setState re-calls the build method of this state

    _totalScore += score;

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
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

class ClassSkeleton {
  String name;
  int totalBones;

  ClassSkeleton({this.name = 'anonymous', @required this.totalBones});
}

// RIVE ANIMATION CODE

/*
class RiveAnim extends StatefulWidget {
  @override
  _RiveAnim createState() => _RiveAnim();
}

class _RiveAnim extends State<RiveAnim> {

  void _togglePlay() {
    setState(() => _controller.isActive = !_controller.isActive);
  }

  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard _riveArtboard;
  RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/anims/mouth.riv').then(
      (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller = SimpleAnimation('open'));
          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  /// Show the rive file, when loaded
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : Rive(artboard: _riveArtboard),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
*/
