import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: Container(
        child: ListView(
          children: const <Widget>[
            Card(
                child: ListTile(
                    title: Text('What is Wise Foods?',
                        style: TextStyle(fontWeight: FontWeight.bold)))),
            Padding(
              padding: EdgeInsets.all(8.0),
              child:
                  Text('Wise Foods is an online food recommendations service.'),
            ),
            Card(
                child: ListTile(
                    title: Text(
              'What does Wise Foods do?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ))),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'We simply take your submitted order and send it to the restaurant through a completely automated process, so you don’t have to deal with all the hassle of ordering and we make sure that you receive your order on time, every-time!',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Card(
                child: ListTile(
                    title: Text('Do you have special offers?',
                        style: TextStyle(fontWeight: FontWeight.bold)))),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  'Yes. You can view the latest restaurant promotions and discount coupon in offers tab.'),
            ),
            Card(
                child: ListTile(
                    title: Text('How do I add an item as a favorite?',
                        style: TextStyle(fontWeight: FontWeight.bold)))),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  'You can simply click on the icon ‘add to favorite’ available on all menu items on restaurants. You can also easily go to my favorites section on My Account page re order these items.'),
            ),
          ],
        ),
      ),
    );
  }
}
