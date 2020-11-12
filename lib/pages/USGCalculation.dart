import 'package:flutter/material.dart';
import 'package:preg_calc/widgets/DateWidget.dart';
import 'package:preg_calc/widgets/MonthWidget.dart';
import 'package:preg_calc/widgets/ResultCard.dart';
import 'package:preg_calc/widgets/USGWeekSlider.dart';
import 'package:preg_calc/widgets/USGDaySlider.dart';
import 'package:provider/provider.dart';
import 'package:preg_calc/models/USG.dart';

class USGCalculation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => USG(),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
            child: Text('When was the USG done?'),
          ),
          DateWidget(type: 'usg'),
          MonthWidget(type: 'usg'),
          USGWeekSlider(),
          USGDaySlider(),
          SizedBox(
            height: 4.0,
          ),
          ResultCard(type: 'usg')
        ],
      ),
    );
  }
}
