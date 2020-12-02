import 'package:flutter/material.dart';
import 'package:wisefood/cusines.dart';
import 'menu_data.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Text(
                'My Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90.0),
                color: Colors.green[100],
              ),
            ),
            Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: Colors.green[100],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CuisinePage()),
                    );
                  },
                  child: Text(
                    'Cuisines',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
            Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: Colors.green[100],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CuisinePage()),
                    );
                  },
                  child: Text(
                    'My Orders',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
            Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: Colors.green[100],
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Tank()),
                    // );
                  },
                  child: Text(
                    'About Us',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
            Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: Colors.green[100],
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Tank()),
                    // );
                  },
                  child: Text(
                    'Log Out',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
