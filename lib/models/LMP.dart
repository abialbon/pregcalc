import 'package:preg_calc/models/POGQuery.dart';
import 'package:intl/intl.dart';

class LMP extends POGQuery {
  int _cycleLength = 28;
  int year;

  int get cycleLength => _cycleLength;

  set cycleLength(int cl) {
    _cycleLength = cl;
    if (canBeCalculated()) calculate();
  }

  @override
  bool canBeCalculated() {
    return (this.day != null && this.month != null);
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

    DateTime selectedDate =
    new DateTime(year, month, day);
    int irregularityCorrection = cycleLength - 28;
    edd = selectedDate.add(Duration(days: 280 + irregularityCorrection));
    Duration pog = today.difference(selectedDate);
    pogWeeks = pog.inDays ~/ 7;
    pogDays = pog.inDays % 7;

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
