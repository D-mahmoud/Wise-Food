import 'package:flutter/material.dart';
import 'package:wisefood/menu_tile.dart';
import 'menu_data.dart';
import 'store_profile.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  final StoreData appLogic = StoreData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recommendations'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
              padding: const EdgeInsets.all(5),
              crossAxisCount: 1,
              children: <Widget>[
                MenuTile(
                    image: appLogic.getData(0)[2],
                    text: appLogic.getData(0)[0]),
                MenuTile(
                    image: appLogic.getData(1)[2],
                    text: appLogic.getData(1)[0]),
                MenuTile(
                    image: appLogic.getData(2)[2],
                    text: appLogic.getData(2)[0]),
                MenuTile(
                    image: appLogic.getData(3)[2],
                    text: appLogic.getData(3)[0]),
                MenuTile(
                    image: appLogic.getData(4)[2],
                    text: appLogic.getData(4)[0]),
              ]),
        ));
  }
}
