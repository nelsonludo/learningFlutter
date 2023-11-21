import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result({required this.resultScore, required this.resetHandler});

  String get resultPhrase {
    var resultText = resultScore <= 10
        ? 'You should be ashamed of yourself'
        : resultScore <= 20
            ? 'keep trying you can make it'
            : resultScore <= 30
                ? 'You did it you are awesome and great!!'
                : resultScore <= 50
                    ? 'You are the best in the world my dude'
                    : 'words cannot explain how proud of you i am rn';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: resetHandler, child: Text('Restart Quiz!'))
        ],
      ),
    );
  }
}
