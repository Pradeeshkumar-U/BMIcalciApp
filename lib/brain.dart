import 'dart:math';

class Brain {
  int height;
  int weight;
  double bmi = 0.0;
  Brain({required this.height, required this.weight});
  String calc() {
    if (height == 1) {
      bmi = 0.0;
      return bmi.toString();
    } else {
      bmi = weight / (pow(height / 100, 2));
      return bmi.toStringAsFixed(1);
    }
  }

  String resultText() {
    if (bmi < 18.5 && bmi > 0) {
      return 'UNDER WEIGHT';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'NORMAL';
    } else if (bmi >= 25 && bmi < 30.0) {
      return 'OVER WEIGHT';
    } else if (bmi >= 30 && bmi < 35) {
      return 'OBESE';
    } else if (bmi >= 35) {
      return 'EXTREMELY OBESE';
    } else {
      return '---------------';
    }
  }

  String resultOverview() {
    if (bmi < 18.5 && bmi > 0) {
      return '"Empower Your Health: Achieve Your Ideal Weight"';
    } else if (bmi >= 18.5 && bmi < 25) {
      return '"Your Perfect Balance: Live Well, Feel Well"';
    } else if (bmi >= 25 && bmi < 30.0) {
      return '"Commit to Fit: A Healthier Tomorrow Starts Today"';
    } else if (bmi >= 30 && bmi < 35) {
      return '"Transform Your Life: Healthier Choices, Brighter Future"';
    } else if (bmi >= 35) {
      return '"Hope and Health: Together We Can Overcome"';
    } else {
      return '"Don\'t Be Shy! Type a Value to See the Results!"';
    }
  }
}
