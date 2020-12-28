import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite Comic universe?',
      'answers': [
        {'text': 'DC', 'score': 10},
        {'text': 'Mavel', 'score': 5},
        {'text': 'Unbreakable', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favorite Comic Movie?',
      'answers': [
        {'text': 'Endgame', 'score': 3},
        {'text': 'Dark knight Trilogy', 'score': 11},
        {'text': 'Deadpool', 'score': 5},
        {'text': 'Man of Steel', 'score': 9},
      ],
    },
    {
      'questionText': 'What\'s your favorite character?',
      'answers': [
        {'text': 'Batman', 'score': 1},
        {'text': 'Superman', 'score': 1},
        {'text': 'Aquaman', 'score': 1},
        {'text': 'Wonder Woman', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
