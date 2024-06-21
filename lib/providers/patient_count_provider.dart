import 'package:flutter/material.dart';

class PatientCountProvider extends ChangeNotifier {
  int _malecount = 0;
  int _femalecount = 0;

  int get malecount => _malecount;
  int get femalecount => _femalecount;

  void maleincriment() {
    _malecount++;
    notifyListeners();
  }

  void maledecriment() {
    _malecount--;
    notifyListeners();
  }

  void femaleincriment() {
    _femalecount++;
    notifyListeners();
  }

  void femaledecriment() {
    _femalecount--;
    notifyListeners();
  }
}
