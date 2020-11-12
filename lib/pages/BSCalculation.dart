import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:preg_calc/models/Bishop.dart';
import 'package:preg_calc/utility/Configs.dart';

Configs config = Configs();

class BSCalculation extends StatefulWidget {
  @override
  _BSCalculationState createState() => _BSCalculationState();
}

class _BSCalculationState extends State<BSCalculation> {
  List<String> positionOptions = ['Posterior', 'Mid', 'Anterior'];
  List<bool> positionSelected = [true, false, false];

  List<String> consistencyOptions = ['Firm', 'Medium', 'Soft'];
  List<bool> consistencySelected = [true, false, false];

  List<String> effacementOptions = ['0-30', '40-50', '60-70', '80+'];
  List<bool> effacementSelected = [true, false, false, false];

  List<String> dilationOptions = ['0', '1-2', '3-4', '5+'];
  List<bool> dilationSelected = [true, false, false, false];

  List<String> stationOptions = ['-3', '-2', '-1/0', '+1/+2'];
  List<bool> stationSelected = [true, false, false, false];

  ListTile generateListTile(
      {String label,
      List<String> options,
      List<bool> isSelected,
      Function setScore}) {
    return ListTile(
      title: Text(label),
      trailing: ToggleButtons(
        borderWidth: 0.5,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        children: List.generate(options.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
            child: Text('${options[index]}',
            style: TextStyle(
              fontFamily: 'Inter'
            ),),
          );
        }).toList(),
        onPressed: (int i) {
          setState(() {
            for (int buttonIndex = 0;
                buttonIndex < isSelected.length;
                buttonIndex++) {
              if (buttonIndex == i) {
                isSelected[buttonIndex] = true;
              } else {
                isSelected[buttonIndex] = false;
              }
            }
            setScore(i);
          });
        },
        isSelected: isSelected,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(child: Text('ENTER CERVICAL FINDINGS',
        style: config.hintStyle),),
        SizedBox(
          height: 10.0,
        ),
        generateListTile(
            label: 'Position',
            options: positionOptions,
            isSelected: positionSelected,
            setScore:
                Provider.of<Bishop>(context, listen: false).setPositionScore),
        generateListTile(
            label: 'Consistency',
            options: consistencyOptions,
            isSelected: consistencySelected,
            setScore: Provider.of<Bishop>(context, listen: false)
                .setConsistencyScore),
        generateListTile(
            label: 'Effacement',
            options: effacementOptions,
            isSelected: effacementSelected,
            setScore:
                Provider.of<Bishop>(context, listen: false).setEffacementScore),
        generateListTile(
            label: 'Dilation',
            options: dilationOptions,
            isSelected: dilationSelected,
            setScore:
                Provider.of<Bishop>(context, listen: false).setDilationScore),
        generateListTile(
            label: 'Station',
            options: stationOptions,
            isSelected: stationSelected,
            setScore:
                Provider.of<Bishop>(context, listen: false).setStationScore),
        SizedBox(
          height: 4.0,
        ),
        Column(
          children: [
            Container(
              width: 120.0,
              child: OutlineButton(
                  onPressed: () {
                    Provider.of<Bishop>(context, listen: false).reset();
                    setState(() {
                      List<List<bool>> scoreTrackers = [
                        positionSelected, consistencySelected, effacementSelected, dilationSelected, stationSelected
                      ];

                      for (int i = 0; i < scoreTrackers.length; i++) {
                        for(int j = 0; j < scoreTrackers[i].length; j++) {
                          if (j == 0) {
                            scoreTrackers[i][j] = true;
                          } else {
                            scoreTrackers[i][j] = false;
                          }
                        }
                      }
                    });
                  },
                  child: Text('Reset',
                  style: TextStyle(
                    color: Colors.red
                  ),)),
            ),
          ],
        ),
        SizedBox(
          height: 4.0,
        ),
        Consumer<Bishop>(builder: (context, bishop, _) {
          return Card(
              elevation: 3,
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('TOTAL SCORE',
                      style: config.hintStyle,),
                    SizedBox(height: 4.0),
                    Text(
                      '${bishop.totalScore}',
                      style: config.resultStyle,
                    )
                  ],
                ),
              ));
        })
      ],
    );
  }
}
