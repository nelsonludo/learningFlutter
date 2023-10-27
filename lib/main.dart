// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      if (_questionIndex >= 0 && _questionIndex < 2) {
        _questionIndex += 1;
      }
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': "what's your favorite color ?",
        'answers': ['Black', 'Blue', 'Yellow']
      },
      {
        'questionText': "what's your favorite animal ?",
        'answers': ['Possum', 'Angler Fish', 'Monkey', 'Beaver']
      },
      {
        'questionText': "how much do you think i am cool",
        'answers': ['very too much too much', 'very much', 'much']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first App'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText'] as String),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
