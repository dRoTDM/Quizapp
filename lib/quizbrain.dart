import 'package:flutter/material.dart';
import 'package:QuizApp/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int _questionCounter = 0;
  int _score = 0;

  List<Icon> _scoreKeeper = [];
  List<Question> _questions = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, '
        'because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void _updateQuestions({BuildContext context}) {
    if (_questionCounter < _questions.length - 1) {
      _questionCounter++;
    } else {
      Alert(
              context: context,
              title: "END OF QUIZ",
              desc: "Final score: $_score/${_questions.length}")
          .show();
      _scoreKeeper.clear();
      _questionCounter = 0;
      _score = 0;
    }
  }

  void checkUserAnswer({bool answer, BuildContext context}) {
    if (_questions[_questionCounter].answer == answer) {
      _scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
      _score++;
    } else {
      _scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
    _updateQuestions(context: context);
  }

  List<Icon> getScoreKeeper() {
    return _scoreKeeper;
  }

  String getQuestion() {
    return _questions[_questionCounter].question;
  }

  String getScore() {
    if (_questionCounter < 1) {
      return 'Score: 0';
    } else {
      return 'Score: $_score/$_questionCounter';
    }
  }
}
