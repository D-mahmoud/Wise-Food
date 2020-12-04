import 'package:flutter/material.dart';
import 'package:wisefood/menu_tile.dart';
import 'menu_data.dart';
import 'store_profile.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final StoreData appLogic = StoreData();
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

            ///search bar by using textfields
            title: !isSearch
                ? Text('Control Page')
                : TextField(
                    decoration: InputDecoration(
                        hintText: 'Search For Restaurants Here'),
                  ),
            actions: <Widget>[
              isSearch
                  ? IconButton(
                      icon: Icon(Icons.cancel),
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          this.isSearch = false;
                        });
                      })
                  : Row(children: [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              this.isSearch = true;
                            });
                          }),
                    ]),
            ]),
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
