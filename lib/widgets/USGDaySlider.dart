import 'package:flutter/material.dart';
import 'package:preg_calc/models/USG.dart';
import 'package:provider/provider.dart';
import 'package:preg_calc/utility/Configs.dart';

Configs config = Configs();

class USGDaySlider extends StatefulWidget {
  @override
  _USGDaySliderState createState() => _USGDaySliderState();
}

class _USGDaySliderState extends State<USGDaySlider> {

  int sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$sliderValue days',
        style: config.infoStyle,),
        Slider(
          min: 0,
          max: 6,
          label: '$sliderValue',
          value: sliderValue/1,
          onChanged: (double d) {
            setState(() {
              sliderValue = d.round();
              Provider.of<USG>(context, listen: false).usgDays = sliderValue;
            });
          },
        ),
      ],
    );
  }
}
