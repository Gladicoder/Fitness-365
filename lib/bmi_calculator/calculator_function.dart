import 'dart:math';

double _bmi;

class CalculatorFunction {
  CalculatorFunction({this.weight, this.height});

  final int weight;
  final int height;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getNormal() {
    if (_bmi <= 18.5) {
      return 'UnderWeight';
    } else if (_bmi <= 25) {
      return 'Normal';
    } else if (_bmi > 26) {
      return 'OverWeight';
    } else if (_bmi > 30) {
      return 'obese';
    } else {
      return 'Wow, I am speechless!';
    }
  }

  String getDescription() {
    if (_bmi <= 18.5) {
      return 'You have a lower body weight than normal. Try having a balanced diet or eat more healthy food';
    } else if (_bmi <= 25) {
      return 'You have a normal body weight so, No Worries!';
    } else if (_bmi > 26) {
      return 'You have a higher body weight than normal. Try to exercise more and eat less food';
    } else if (_bmi > 30) {
      return 'You have a really high body weight that is shocking to me. Take advice from a doctor';
    } else {
      return 'Wow, I am speechless!';
    }
  }
}
