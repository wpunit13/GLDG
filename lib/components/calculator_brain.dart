import 'dart:math';

import 'package:flutter/foundation.dart';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi;

  CalculatorBrain({this.weight, this.height});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal BMI. Try to excercise more and cut calories';
    } else if (_bmi > 18) {
      return 'You are perfect. Continue to do what you have been doing. However little bit of excercise hurts no one';
    } else {
      return 'You have lower than normal BMI. You should eat more however watch what you eat.';
    }
  }
}
