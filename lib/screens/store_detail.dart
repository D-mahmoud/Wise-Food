import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'package:wisefood/providers/stores.dart';

class StoreDetail extends StatelessWidget {
  static const routeName = 'store-detail';

  @override
  Widget build(BuildContext context) {
    final storeId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedStore = Provider.of<Stores>(
      context,
      listen: false,
    ).findById(storeId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedStore.storeTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Container(
            //   height: 300,
            //   width: double.infinity,
            //   child: Image.network(
            //     loadedStore.imageUrl,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            SizedBox(height: 10),
            Text(
              '${loadedStore.number}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedStore.location,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),

            // Padding(
            //   ///Rating Bar using Flutter
            //   padding: const EdgeInsets.all(10.0),
            //   child: new Container(
            //     child: RatingBarIndicator(
            //       rating: loadedStore.rating,
            //       itemBuilder: (context, index) => Icon(
            //         Icons.star_border_outlined,
            //         color: Colors.amber,
            //       ),
            //       itemCount: 5,
            //       itemSize: 50.0,
            //       direction: Axis.horizontal,
            //     ),

            //   ),
            // ),
// new Container(
//   child:Text(loadedStore.rating.toString() ),
// ),
            new Container(
                child: RatingBar.builder(
              initialRating: loadedStore.rating,
              // minRating: 2,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              // onRatingUpdate: (rating) {
              //   print(rating);
              // },
            )),
          ],
        ),
      ),
    );
  }
}
