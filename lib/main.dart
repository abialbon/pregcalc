import 'package:flutter/material.dart';
import 'package:preg_calc/pages/Home.dart';
import 'package:preg_calc/pages/FaqPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.teal,
        primaryColor: Colors.teal[700],
        primaryColorDark: Colors.teal[700]
      ),
      home: Home(),
      routes: {
        '/faq' : (context) => FaqPage()
      },
    );
  }
}
