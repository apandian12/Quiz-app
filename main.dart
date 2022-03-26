import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

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
      'questionText': 'What is your favorite Color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 4},
        {'text': 'White', 'score': 3}
      ],
    },
    {
      'questionText': 'What is your favorite Animals?',
      'answers': [
        {'text': 'Lion', 'score': 9},
        {'text': 'Tiger', 'score': 5},
        {'text': 'Horse', 'score': 6},
        {'text': 'Cat', 'score': 1}
      ],
    },
    {
      'questionText': 'What is your favorite Place?',
      'answers': [
        {'text': 'Madurai', 'score': 2},
        {'text': 'Kerala', 'score': 7},
        {'text': 'Goa', 'score': 4},
        {'text': 'Chennai', 'score': 5}
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
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more questions!');
    } else {
      print('No more question!');
    }
  }

  @override
  Widget build(BuildContext context) {
    //var dummy = ['Hello'];
    //dummy.add('Max');
    //print(dummy);
    //  questions = []; // does not work if the question is const
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
