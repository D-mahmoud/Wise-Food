import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreTile extends StatelessWidget {
  final String storeTitle;
  final String rating;
  final String image;
  final String location;
  final String number;

  StoreTile(
      {this.storeTitle, this.rating, this.image, this.location, this.number});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      new Container(
        child: Row(children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90.0),
              color: Colors.green[100],
            ),
            child: Image.asset(
              image,
              width: 100,
              height: 100,
              alignment: Alignment.topLeft,
            ),
          ),
          Container(
              child: Text(storeTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'MajorMono',
                      fontWeight: FontWeight.bold,
                      fontSize: 22))),
        ]),
      ),
      new Container(
          child: Text(rating,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'MajorMono',
                  fontWeight: FontWeight.bold,
                  fontSize: 22))),
      new Container(
          child: Text(location,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'MajorMono',
                  fontWeight: FontWeight.bold,
                  fontSize: 22))),
      new Container(
          child: Text(number,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'MajorMono',
                  fontWeight: FontWeight.bold,
                  fontSize: 22))),
    ]));
  }
}
