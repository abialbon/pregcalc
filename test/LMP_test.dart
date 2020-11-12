import 'package:test/test.dart';
import 'package:preg_calc/models/LMP.dart';

void main() {
  test('LMP calculation works', () {
    final LMP lmp = LMP();
    lmp.day = 2;
    lmp.month = 11;
    assert(lmp.pogWeeks == 0);
    assert(lmp.pogDays == 1);
    assert(lmp.eddString == 'Aug 9, 2021');
  });
}