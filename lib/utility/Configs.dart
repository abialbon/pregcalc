import 'package:flutter/material.dart';

class Configs {
  Configs._privateConstructor();

  static final Configs _configs = Configs._privateConstructor();

  factory Configs() {
    return _configs;
  }

  final TextStyle resultStyle = TextStyle(
    fontSize: 20.0,
    fontFamily: 'JetBrainsMono'
  );

  final TextStyle hintStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
    height: 1.2,
  );

  final TextStyle infoStyle =  TextStyle(
      fontSize: 16.0
  );

}