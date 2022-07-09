import 'package:bmiapp/data/services/bmi_services.dart';

class BmiRepo{
  static double calculateBrain(int _weight, int _height) {
    return BmiServices.calculateBrain(_weight, _height);
  }

  static String getResult(double _bmi) {
    return BmiServices.getResult(_bmi);
  }

  static String getInterpretation(double _bmi) {
    return BmiServices.getInterpretation(_bmi);
  }
}