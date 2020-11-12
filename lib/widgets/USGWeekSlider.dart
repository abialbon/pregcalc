import 'package:flutter/material.dart';
import 'package:preg_calc/models/USG.dart';
import 'package:provider/provider.dart';
import 'package:preg_calc/utility/Configs.dart';

Configs config = Configs();

class USGWeekSlider extends StatefulWidget {
  @override
  _USGWeekSliderState createState() => _USGWeekSliderState();
}

class _USGWeekSliderState extends State<USGWeekSlider> {

  int sliderValue = 12;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 4.0,
        ),
        Text(
          'GESTATIONAL AGE BY USG',
          style: config.hintStyle,
        ),
        SizedBox(
          height: 4.0,
        ),
        Text('$sliderValue weeks',
        style: config.infoStyle,),
        Slider(
          min: 0,
          max: 22,
          label: '$sliderValue',
          value: sliderValue/1,
          onChanged: (double d) {
            setState(() {
              sliderValue = d.round();
              Provider.of<USG>(context, listen: false).usgWeeks = sliderValue;
            });
          },
        ),
      ],
    );
  }
}
