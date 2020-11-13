import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AboutPage extends StatelessWidget {

  _launchURL() async {
  const url = 'https://github.com/abialbon/pregcalc';
  if (await canLaunch(url)) {
    await launch(url);
  } 
}


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          leading: Icon(Icons.help_outline),
          title: Text('Have a doubt?'),
          subtitle: Text('Read the FAQ'),
          onTap: () {
            Navigator.pushNamed(context, '/faq');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(MdiIcons.github),
          title: Text('It\'s open source'),
          subtitle: Text('Read the source code'),
          onTap: () {
            _launchURL();
          },
        ),
        Divider(),
        Container(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      child: Image.asset('assets/logo.png'),
                    ),
                    Text('PregCalc', style: TextStyle(fontSize: 20.0, fontFamily: 'Inter'),),
                    SizedBox(height: 10.0,),
                    Text('by Abialbon Paul'),
                    Text('version 1.1.2')
                  ]
              ),
            )
        ),
        Divider()
      ],
    );
  }
}
