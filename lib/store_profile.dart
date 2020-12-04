import 'package:flutter/material.dart';
import 'menu_data.dart';
import 'store_tile.dart';

class StoreProfile extends StatefulWidget {
  @override
  _StoreProfileState createState() => _StoreProfileState();
}

class _StoreProfileState extends State<StoreProfile> {
  final StoreData appLogic = StoreData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Store Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
              padding: const EdgeInsets.all(4),
              crossAxisCount: 1,
              children: <Widget>[
                StoreTile(
                  storeTitle: appLogic.getData(0)[0],
                  rating: appLogic.getData(0)[1],
                  image: appLogic.getData(0)[2],
                  location: appLogic.getData(0)[3],
                  number: appLogic.getData(0)[4],
                ),
                new Container(
                  child: ListView(
                    children: <Widget>[
                      Card(
                          child: ListTile(title: Text(appLogic.getData(0)[5]))),
                    ],
                  ),
                ),
              ]),
        ));
  }
}
