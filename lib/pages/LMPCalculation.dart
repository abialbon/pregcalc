import 'package:flutter/material.dart';
import 'package:preg_calc/widgets/DateWidget.dart';
import 'package:preg_calc/widgets/MonthWidget.dart';
import 'package:preg_calc/widgets/ResultCard.dart';
import 'package:provider/provider.dart';
import 'package:preg_calc/models/LMP.dart';
import 'package:preg_calc/widgets/VariabilitySlider.dart';


class LMPCalculation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LMP(),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DateWidget(type: 'lmp'),
          MonthWidget(type: 'lmp'),
          VariabilitySlider(),
          SizedBox(
            height: 4.0,
          ),
          ResultCard(type: 'lmp')
        ],
      ),
    );
  }
}
