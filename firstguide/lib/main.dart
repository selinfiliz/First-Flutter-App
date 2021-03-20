import 'package:firstguide/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp()); //it calls the widget
}

class MyApp extends StatefulWidget {
  //it was a stateless widget we cahnged to stateful widget

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //stateful widget
  final _questions = const [
    //using mapping (key value pairs)
    {
      'questionText': 'Whats your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Cat', 'score': 5},
        {'text': 'Dog', 'score': 3},
        {'text': 'Horse', 'score': 0},
        {'text': 'Lion', 'score': 9},
      ]
    },

    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Sel', 'score': 10},
        {'text': 'Sel', 'score': 10},
        {'text': 'Sel', 'score': 10},
        {'text': 'Sel', 'score': 10},
      ]
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
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print((_questionIndex));

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
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
