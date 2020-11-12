import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL() async {
  const url = 'https://www.buymeacoffee.com/abialbon';
  if (await canLaunch(url)) {
    await launch(url);
  }
}

class AboutPage extends StatelessWidget {
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
        Card(
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
                    Text('version 1.0.0')
                  ]
              ),
            )
        ),
      ],
    );
  }
}
