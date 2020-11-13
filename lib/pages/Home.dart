import 'package:flutter/material.dart';
import 'package:preg_calc/pages/EDDCalculation.dart';
import 'package:preg_calc/pages/LMPCalculation.dart';
import 'package:preg_calc/pages/USGCalculation.dart';
import 'package:preg_calc/pages/BSCalculation.dart';
import 'package:preg_calc/pages/About.dart';
import 'package:preg_calc/models/Bishop.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;
  
  List<String> titles = [
    'Last Menstural Period',
    'Ultrasonography Date',
    'Expected Due Date',
    'Bishop Score',
    'About'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${titles.elementAt(_selectedIndex)}',
          style: TextStyle(
              fontFamily: 'Inter'
          ),),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/faq');
              },
              child: Text('FAQ', style: TextStyle(
                color: Colors.white
              )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              LMPCalculation(),
              USGCalculation(),
              EDDCalculation(),
              ChangeNotifierProvider(
                  create: (context) => Bishop(),
                  child: BSCalculation()
              ),
              AboutPage()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(MdiIcons.water, color: Colors.red,), label: 'LMP'),
          BottomNavigationBarItem(icon: Icon(MdiIcons.carWindshield, color: Colors.purple), label: 'USG'),
          BottomNavigationBarItem(icon: Icon(MdiIcons.calendar, color: Colors.orange), label: 'EDD'),
          BottomNavigationBarItem(icon: Icon(MdiIcons.calculator, color: Colors.teal), label: 'BISHOP'),
          BottomNavigationBarItem(icon: Icon(Icons.info_rounded, color: Colors.amber), label: 'ABOUT')
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
