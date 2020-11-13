import 'package:flutter/material.dart';
import 'package:preg_calc/models/EDD.dart';
import 'package:preg_calc/models/USG.dart';
import 'package:provider/provider.dart';
import 'package:preg_calc/models/LMP.dart';
import 'package:preg_calc/utility/Configs.dart';

Configs config = Configs();

Map<int, String> monthMap = {
  1: 'Jan',
  2: 'Feb',
  3: 'Mar',
  4: 'Apr',
  5: 'May',
  6: 'Jun',
  7: 'Jul',
  8: 'Aug',
  9: 'Sep',
  10: 'Oct',
  11: 'Nov',
  12: 'Dec'
};

class MonthWidget extends StatefulWidget {
  final String type;
  MonthWidget({this.type});

  @override
  _MonthWidgetState createState() => _MonthWidgetState();
}

class _MonthWidgetState extends State<MonthWidget> {
  int selectedMonth;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double gridWidth = screenWidth - 16;
    if (gridWidth > 420) {
      gridWidth = 420.0;
    }
    int noOfColumns = 6;
    double aspectRatio = 1.8;
    double gridHeight = (((gridWidth / noOfColumns) / aspectRatio) * 2) + 8;

    return Column(
      children: [
        Text(
          'SELECT MONTH',
          style: config.hintStyle,
        ),
        SizedBox(
          height: 4.0,
        ),
        Container(
            height: gridHeight,
            width: gridWidth,
            child: GridView.count(
                crossAxisCount: noOfColumns,
                mainAxisSpacing: 4.0,
                childAspectRatio: aspectRatio,
                physics: NeverScrollableScrollPhysics(),
                children: List<Widget>.generate(12, (index) {
                  return ChipTheme(
                    data: ChipTheme.of(context).copyWith(
                      secondarySelectedColor: Theme.of(context).primaryColor,
                      secondaryLabelStyle: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    child: ChoiceChip(
                      label: Text('${monthMap[index + 1]}'),
                      selected: selectedMonth == index + 1,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedMonth = selected ? index + 1 : null;
                          if (widget.type == 'lmp') {
                            Provider.of<LMP>(context, listen: false).month =
                                selectedMonth;
                          } else if (widget.type == 'usg') {
                            Provider.of<USG>(context, listen: false).month =
                                selectedMonth;
                          } else {
                            Provider.of<EDD>(context, listen: false).month =
                                selectedMonth;
                          }
                        });
                      },
                    ),
                  );
                }).toList())),
      ],
    );
  }
}
