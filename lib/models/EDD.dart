import 'package:preg_calc/models/POGQuery.dart';

class EDD extends POGQuery {

  int year;

  @override
  void calculate() {
    DateTime today = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    int todayMonth = today.month;
    int todayYear = today.year;

    if (month >= todayMonth - 1) {
      year = todayYear;
    } else {
      year = todayYear + 1;
    }

    if (!isValidDate(year, month, day)) {
      success = false;
      message = 'Not a valid date';
      notifyListeners();
      return;
    }

    DateTime selectedDate = new DateTime(year, month, day);
    Duration daysLeft = selectedDate.difference(today);

    if ((daysLeft.inDays > 280) || (daysLeft.inDays < -14)) {
      success = false;
      message = 'Exceeds normal gestation period';
      notifyListeners();
      return;
    }

    pogDays = (280 - daysLeft.inDays) % 7;
    pogWeeks = (280 - daysLeft.inDays) ~/ 7;

    success = true;
    notifyListeners();
    return;
  }

  @override
  bool canBeCalculated() {
    return (this.day != null) && (this.month != null);
  }
  
}