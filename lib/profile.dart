import 'package:flutter/material.dart';
import 'package:wisefood/cusines.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
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
