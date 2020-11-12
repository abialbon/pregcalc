import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:preg_calc/models/LMP.dart';
import 'package:preg_calc/models/USG.dart';
import 'package:preg_calc/utility/Configs.dart';

Configs config = Configs();

class ResultCard extends StatelessWidget {
  final String type;
  ResultCard({this.type});
  
  Column getColumn(var query) {
    return Column(
      children: [
        Text('PERIOD OF GESTATION',
          style: config.hintStyle,),
        SizedBox(height: 4.0),
        Text(
          '${query.pogWeeks} weeks ${query.pogDays} days',
          style: config.resultStyle,
        ),
        SizedBox(height: 16.0),
        Text('EXPECTED DATE OF DELIVERY',
          style: config.hintStyle,),
        SizedBox(height: 4.0),
        Text(
          '${query.eddString}',
          style: config.resultStyle,
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    if (type == 'lmp') {
      return Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Consumer<LMP>(builder: (context, query, _) {
            if (!query.success) {
              return Text('${query.message}');
            }
            return getColumn(query);
          }),
        ),
      );
    } else {
      return Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Consumer<USG>(builder: (context, query, _) {
            if (!query.success) {
              return Text('${query.message}');
            }
            return getColumn(query);
          }),
        ),
      );
    }
  }
}
