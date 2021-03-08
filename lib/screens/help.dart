import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Container(
        child: ListView(
          children: const <Widget>[
            Card(
                child:
                    ListTile(title: Text('I need help with a current order.'))),
            Card(child: ListTile(title: Text('I need help with my previous.'))),
            Card(child: ListTile(title: Text('I have a question.'))),
            Card(child: ListTile(title: Text('COVID 19 questions'))),
          ],
        ),
      ),
    );
  }
}
