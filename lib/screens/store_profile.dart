import 'package:flutter/material.dart';
import 'package:wisefood/providers/stores.dart';
import 'package:provider/provider.dart' as provider;

class StoreProfile extends StatefulWidget {
  @override
  _StoreProfileState createState() => _StoreProfileState();
}

class _StoreProfileState extends State<StoreProfile> {
  @override
  Widget build(BuildContext context) {
    final storeID = ModalRoute.of(context).settings.arguments;
    final loadedStore = provider.Provider.of<Stores>(
      context,
      listen: false,
    ).findById(storeID);
    print(storeID);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedStore.storeTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedStore.image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$${loadedStore.number}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedStore.location,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
///////////////////
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
                  Text("Wise Foods is an online food recommendations service."),
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
                "We simply take your submitted order and send it to the restaurant through a completely automated process, so you don’t have to deal with all the hassle of ordering and we make sure that you receive your order on time, every-time!",
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
                  "Yes. You can view the latest restaurant promotions and discount coupon in offers tab."),
            ),
            Card(
                child: ListTile(
                    title: Text('How do I add an item as a favorite?',
                        style: TextStyle(fontWeight: FontWeight.bold)))),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "You can simply click on the icon ‘add to favorite’ available on all menu items on restaurants. You can also easily go to my favorites section on My Account page re order these items."),
            ),
          ],
        ),
      ),
    );
  }
}
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
                  Text("Wise Foods is an online food recommendations service."),
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
                "We simply take your submitted order and send it to the restaurant through a completely automated process, so you don’t have to deal with all the hassle of ordering and we make sure that you receive your order on time, every-time!",
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
                  "Yes. You can view the latest restaurant promotions and discount coupon in offers tab."),
            ),
            Card(
                child: ListTile(
                    title: Text('How do I add an item as a favorite?',
                        style: TextStyle(fontWeight: FontWeight.bold)))),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "You can simply click on the icon ‘add to favorite’ available on all menu items on restaurants. You can also easily go to my favorites section on My Account page re order these items."),
            ),
          ],
        ),
      ),
    );
  }
}
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
                  Text("Wise Foods is an online food recommendations service."),
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
                "We simply take your submitted order and send it to the restaurant through a completely automated process, so you don’t have to deal with all the hassle of ordering and we make sure that you receive your order on time, every-time!",
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
                  "Yes. You can view the latest restaurant promotions and discount coupon in offers tab."),
            ),
            Card(
                child: ListTile(
                    title: Text('How do I add an item as a favorite?',
                        style: TextStyle(fontWeight: FontWeight.bold)))),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "You can simply click on the icon ‘add to favorite’ available on all menu items on restaurants. You can also easily go to my favorites section on My Account page re order these items."),
            ),
          ],
        ),
      ),
    );
  }
}
