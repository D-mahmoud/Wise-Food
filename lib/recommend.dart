import 'package:flutter/material.dart';
import 'package:wisefood/menu_tile.dart';
import 'menu_data.dart';

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
                    image: appLogic.getData()[2], text: appLogic.getData()[0]),
                MenuTile(image: 'images/ramen.jpg', text: 'Ramen Noodles'),
                MenuTile(image: 'images/hotdogs.jpg', text: 'Hotdogs'),
                MenuTile(image: 'images/nachos.jpg', text: 'Nachos'),
                MenuTile(image: 'images/burgers.jpg', text: 'Butter Burgers'),
              ]),
        ));
  }
}
