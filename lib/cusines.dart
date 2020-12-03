import 'package:flutter/material.dart';

class CuisinePage extends StatefulWidget {
  @override
  __CuisinePageState createState() => __CuisinePageState();
}

class __CuisinePageState extends State<CuisinePage> {
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: !isSearch
              ? Text('Cuisines')
              : TextField(
                  decoration:
                      InputDecoration(hintText: 'Search For Cusines Here'),
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
                : IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        this.isSearch = true;
                      });
                    })
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Text(
                'Choose from our wide range of cusines',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: Colors.green[100],
                  onPressed: () {},
                  child: Text(
                    'Indian',
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
                    'Chinese',
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
                    'Italian',
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
                    'Oriental',
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
                    'Mexican',
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
