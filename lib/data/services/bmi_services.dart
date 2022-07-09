import 'dart:math'as maht;
class BmiServices{
static  double calculateBrain(int _weight, int _height) {
  final   _bmi = _weight /maht. pow ( _height / 100,2);

    return _bmi;
  }
 static String getResult(double _bmi) {
     {
      if (_bmi >= 25) {
        return 'Ашыкча Салмак';
      } else if (_bmi > 18.5) {
        return 'Нормалдуу';
      } else {
        return 'Арыксыз';
      }
    }
  }

 static String getInterpretation(double _bmi) {
    if (_bmi >= 25) {
      return 'Сиздин дене салмагыңыз нормадан жогору. Кобурөөк машыгууга аракет кылыңыз.';
    } else if (_bmi >= 18.5) {
      return 'Сиздин дене салмагыңыз нормалдуу.Эң сонун!';
    } else {
      return 'Сиздин дене салмагыңыз нормадан төмөн. Сиз дагы бир аз салмак кошунуз.';
    }
  }
}