import 'package:flutter/material.dart';

class Faq {
  String question, answer;
  Faq({this.question, this.answer});
}

class FaqPage extends StatelessWidget {
  final List<Faq> faqs = [
    Faq(
        question: 'How can I choose the year?',
        answer: 'This app is designed primarily for healthcare workers '
            'who work in busy environments and have to calculate the expected '
            'date of delivery/period of gestation for many patients. This app '
            'automatically chooses the year based on the date entered. '
            'If the date falls before today, it automatically assumes the current year. '
            'If the date entered falls after today, it assumes the previous year.'
    ),
    Faq(
      question: 'What date should I choose for the Last Menstruation Period?',
      answer: 'The first day of menstrual bleed on the previous menstrual period is the LMP.'
    ),
    Faq(
      question: 'Can\'t set USG determined '
          'gestational age to beyond 22 weeks. Why?',
      answer: 'Beyond 22 weeks, the gestational age determined by USG is not accurate.'
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace:
                FlexibleSpaceBar(title: Text('Frequently Asked Questions')),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate:
                  SliverChildListDelegate(List.generate(faqs.length, (index) {
                return Card(
                    child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${faqs.elementAt(index).question}',
                        style: TextStyle(fontFamily: 'Inter', fontSize: 18.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(faqs.elementAt(index).answer)
                    ],
                  ),
                ));
              })),
            ),
          )
        ],
      ),
    );
  }
}
