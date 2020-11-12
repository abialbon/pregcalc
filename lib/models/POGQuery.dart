import 'package:flutter/material.dart';

abstract class POGQuery with ChangeNotifier {
  int _day, _month;
  bool success = false;
  String message = 'Select a date';

  int pogDays, pogWeeks;
  DateTime edd;
  String eddString;

  int get day => _day;
  int get month => _month;

  set day(int day) {
    _day = day;
    if (canBeCalculated()) calculate();
  }

  set month(int month) {
    _month = month;
    if (canBeCalculated()) calculate();
  }

  bool canBeCalculated();
  void calculate();

  bool isValidDate(int y, int m, int d) {
    String inputString =
        '${y.toString().padLeft(4, '0')}${m.toString().padLeft(2, '0')}${d.toString().padLeft(2, '0')}';
    DateTime parsedDateTime = new DateTime(y, m, d);
    final String py = parsedDateTime.year.toString().padLeft(4, '0');
    final String pm = parsedDateTime.month.toString().padLeft(2, '0');
    final String pd = parsedDateTime.day.toString().padLeft(2, '0');
    String parsedString = '$py$pm$pd';
    return inputString == parsedString;
  }

}