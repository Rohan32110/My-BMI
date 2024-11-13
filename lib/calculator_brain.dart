class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;
  double _bmi = 18;

  String calculateBMI() {
    _bmi = weight / ((height / 100) * (height / 100));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 18.5) {
      return "UNDERWEIGHT";
    } else if (_bmi >= 18.5 && _bmi < 24.9) {
      return "NORMAL";
    } else if (_bmi >= 25 && _bmi < 29.9) {
      return "OVERWEIGHT";
    } else {
      return "OBESE";
    }
  }

  String getInterpretation() {
    if (_bmi < 18.5) {
      return "Your BMI indicates you are underweight. A balanced diet and consultation with a healthcare provider are recommended.";
    } else if (_bmi >= 18.5 && _bmi < 24.9) {
      return "Your BMI is within the normal range. Keep maintaining a healthy lifestyle to stay in this range.";
    } else if (_bmi >= 25 && _bmi < 29.9) {
      return "Your BMI is above the healthy range. Review diet and exercise.";
    } else {
      return "Your BMI is high, increasing health risks. Seek professional advice.";
    }
  }
}
