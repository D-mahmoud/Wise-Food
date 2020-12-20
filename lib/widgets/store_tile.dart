import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rating_bar/rating_bar.dart';

class StoreTile extends StatelessWidget {
  final String storeTitle;
  final String image;
  final String location;
  final String number;
  final double rating;
  final String review;
    
  StoreTile({
    this.storeTitle,
    this.rating,
    this.image,
    this.location,
    this.number,
    this.review,
  });
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
      // Padding(
      //   ///Rating Bar using Flutter
      //   padding: const EdgeInsets.all(10.0),
      //   child: new Container(
      //       child: RatingBar.builder(
      //     initialRating: rating,
      //     minRating: rating,
      //     direction: Axis.horizontal,
      //     allowHalfRating: true,
      //     itemCount: 5,
      //     itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      //     itemBuilder: (context, _) => Icon(
      //       Icons.star,
      //       color: Colors.amber,
      //     ),
      //     onRatingUpdate: (rating) {
      //       print(rating);
      //     },
      //   )),
      // ),

     new Container(
          child: RatingBar.readOnly(
        initialRating: rating,
        isHalfAllowed: true,
        halfFilledIcon: Icons.star_half,
        filledIcon: Icons.star,
        emptyIcon: Icons.star_border,
      )),

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
