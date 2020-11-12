import 'package:preg_calc/models/POGQuery.dart';
import 'package:intl/intl.dart';

class USG extends POGQuery {
  int year, _usgWeeks = 12, _usgDays = 0;

  int get usgWeeks => _usgWeeks;
  set usgWeeks(int weeks) {
    _usgWeeks = weeks;
    if (canBeCalculated()) calculate();
  }

  int get usgDays => _usgDays;
  set usgDays(int days) {
    _usgDays = days;
    if (canBeCalculated()) calculate();
  }

  @override
  bool canBeCalculated() {
    return (day != null && month != null && usgWeeks != null && usgDays != null);
  }

  @override
  void calculate() {
    DateTime today = new DateTime.now();
    int todayDay = today.day;
    int todayMonth = today.month;
    int todayYear = today.year;

    if (month > todayMonth ||
        (month == todayMonth && day > todayDay)) {
      year = todayYear - 1;
    } else {
      year = todayYear;
    }

    if (!isValidDate(year, month, day)) {
      success = false;
      message = 'Not a valid date';
      notifyListeners();
      return;
    }

    DateTime scanDate =
    new DateTime(year, month, day);
    int pregnantDays = (usgWeeks*7 + usgDays);
    int daysMore = 280 - pregnantDays;
    DateTime edd = scanDate.add(new Duration(days: daysMore));
    int daysSinceScan = today.difference(scanDate).inDays;
    pogWeeks = (pregnantDays + daysSinceScan) ~/ 7;
    pogDays = (pregnantDays + daysSinceScan) % 7;

    if ((pogWeeks*7 + pogDays) > 294) {
      success = false;
      message = 'Exceeds normal gestation period';
      notifyListeners();
      return;
    }

    eddString = DateFormat.yMMMd().format(edd);
    success = true;
    notifyListeners();
    return;
  }
}