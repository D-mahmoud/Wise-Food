import 'package:flutter/material.dart';
import 'package:wisefood/menu_tile.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
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
              crossAxisCount: 2,
              children: <Widget>[
                MenuTile(
                    image: 'images/chicken.jpg', text: 'Chicken Drumsticks'),
                MenuTile(image: 'images/ramen.jpg', text: 'Ramen Noodles'),
                MenuTile(image: 'images/hotdogs.jpg', text: 'Hotdogs'),
                MenuTile(image: 'images/nachos.jpg', text: 'Nachos'),
                MenuTile(image: 'images/burgers.jpg', text: 'Butter Burgers'),
              ]),
        ));
  }
}
