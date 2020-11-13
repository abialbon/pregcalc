import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preg_calc/models/EDD.dart';
import 'package:preg_calc/models/USG.dart';
import 'package:provider/provider.dart';
import 'package:preg_calc/models/LMP.dart';
import 'package:preg_calc/utility/Configs.dart';

Configs config = Configs();

class DateWidget extends StatefulWidget {

  final String type;
  DateWidget({ this.type });

  @override
  _DateWidgetState createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  int selectedDay;

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double gridWidth = screenWidth - 16;
    if (gridWidth > 420) {
      gridWidth = 420.0;
    }
    int noOfColumns = 7;
    double aspectRatio = 1.25;
    double gridHeight = (((gridWidth/noOfColumns)/aspectRatio)*5) + 8;

    return Column(
      children: [
        Text('SELECT DATE',
            style: config.hintStyle
        ),
        SizedBox(height: 4.0,),
        Container(
          height: gridHeight,
          width: gridWidth,
          child: GridView.count(
              crossAxisCount: noOfColumns,
              mainAxisSpacing: 1.0,
              childAspectRatio: aspectRatio,
              physics: NeverScrollableScrollPhysics(),
              children: List<Widget>.generate(31, (index) {
                return ChipTheme(
                  data: ChipTheme.of(context).copyWith(
                    secondarySelectedColor: Theme.of(context).primaryColor,
                    secondaryLabelStyle: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  child: ChoiceChip(
                    label: Text('${index + 1}'),
                    selected: selectedDay == index + 1,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedDay = selected ? index + 1 : null;
                        if (widget.type == 'lmp') {
                          Provider.of<LMP>(context, listen: false).day = selectedDay;
                        } else if (widget.type == 'usg') {
                          Provider.of<USG>(context, listen: false).day = selectedDay;
                        } else {
                          Provider.of<EDD>(context, listen: false).day = selectedDay;
                        }
                      });
                    },
                  ),
                );
            }).toList())
        ),
      ],
    );
  }
}
