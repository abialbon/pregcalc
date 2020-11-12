import 'package:flutter/material.dart';
import 'package:preg_calc/models/LMP.dart';
import 'package:provider/provider.dart';
import 'package:preg_calc/utility/Configs.dart';

Configs config = Configs();

class VariabilitySlider extends StatefulWidget {
  @override
  _VariabilitySliderState createState() => _VariabilitySliderState();
}

class _VariabilitySliderState extends State<VariabilitySlider> {
  int sliderValue = 28;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 4.0,
        ),
        Text(
          'CYCLE LENGTH',
          style: config.hintStyle,
        ),
        Slider(
          min: 22,
          max: 34,
          label: '$sliderValue',
          value: sliderValue / 1,
          onChanged: (double d) {
            setState(() {
              sliderValue = d.round();
              Provider.of<LMP>(context, listen: false).cycleLength =
                  sliderValue;
            });
          },
        ),
        Text(
          '$sliderValue days',
          style: config.infoStyle,
        )
      ],
    );
  }
}
