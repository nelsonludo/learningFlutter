// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': "what's your favorite color ?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 6},
        {'text': 'Yellow', 'score': 1}
      ]
    },
    {
      'questionText': "what's your favorite animal ?",
      'answers': [
        {'text': 'Possum', 'score': 10},
        {'text': 'Angler Fish', 'score': 26},
        {'text': 'Monkey', 'score': 1},
        {'text': 'Beaver', 'score': 12}
      ]
    },
    {
      'questionText': "how much do you think i am cool",
      'answers': [
        {'text': 'very too much too much', 'score': 50},
        {'text': 'very much', 'score': 30},
        {'text': 'much', 'score': 5}
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
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more _questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(
                resultScore: _totalScore,
                resetHandler: _resetQuiz,
              ),
      ),
    );
  }
}
