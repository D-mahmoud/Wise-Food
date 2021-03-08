import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisefood/models/store.dart';
import 'package:wisefood/widgets/store_item.dart';
import 'package:wisefood/screens/store_detail.dart';

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

          ///adding search bar here
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
      body: Container(
        height: 550,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Carousel(
                      images: [
                        InkWell(
                            onTap: () {
                              // Navigator.pushNamed(
                              //   context,
                              //   StoreItem.routeName,
                              //   arguments: "chinese",
                              // );
                              print("Chinese");
                            },
                            child: Image.asset('images/chinese.png',
                                fit: BoxFit.fill)),
                        InkWell(
                            onTap: () {},
                            child: Image.asset('images/mexican.jpg',
                                fit: BoxFit.fill)),
                        InkWell(
                            onTap: () {},
                            child: Image.asset('images/oriental.jpg',
                                fit: BoxFit.fill)),
                        InkWell(
                            onTap: () {},
                            child: Image.asset('images/indian.jpg',
                                fit: BoxFit.fill)),
                        InkWell(
                            onTap: () {},
                            child: Image.asset('images/italian.jpg',
                                fit: BoxFit.fill)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 100,
              child: Padding(
                padding: EdgeInsets.only(top: 0, bottom: 0),
                // const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      RaisedButton(
                        padding:
                            //   EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
                            const EdgeInsets.all(40.0),
                        color: Colors.green[100],
                        onPressed: () {},
                        child: Text(
                          'Indian',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      RaisedButton(
                        padding:
                            //     // EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
                            const EdgeInsets.all(40.0),
                        color: Colors.green[100],
                        onPressed: () {},
                        child: Text(
                          'Chinese',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 1, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  RaisedButton(
                    padding: const EdgeInsets.all(40.0),
                    color: Colors.green[100],
                    onPressed: () {},
                    child: Text(
                      'Italian',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  RaisedButton(
                    padding:
                        //  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        const EdgeInsets.all(40.0),
                    //  EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                    color: Colors.green[100],
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        StoreDetail.routeName,
                        arguments: "italian",
                      );
                    },
                    child: Text(
                      'Oriental',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  RaisedButton(
                    // padding:
                    //     //EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    //     const EdgeInsets.all(40.0),
                    color: Colors.green[100],
                    onPressed: () {},
                    child: Text(
                      'Mexican',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
