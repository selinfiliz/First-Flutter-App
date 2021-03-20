import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      // IF YAZDIK!!!!!!!!!!!!!!!
      children: [
        Question(
          questions[questionIndex]
              ['questionText'], //ilkinde sporuyu sonra cevapları aldı
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList() // made questions transform into a widget as map and then to list and send screen?
      ],
    );
  }
}
