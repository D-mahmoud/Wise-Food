import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wisefood/providers/stores.dart';
import 'package:wisefood/widgets/stores/googleMap.dart';

class StoreDetail extends StatelessWidget {
  static const routeName = 'store-detail';

  @override
  Widget build(BuildContext context) {
    final storeId = ModalRoute.of(context).settings.arguments as String;
    final loadedStore = Provider.of<Stores>(
      context,
      listen: false,
    ).findById(storeId);

    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant Info"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedStore.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  loadedStore.storeTitle,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text('Our ',
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        )),
                    SizedBox(height: 10),
                    Text(
                      '${loadedStore.cuisine} ',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('cuisine ',
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        )),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text('Call Us:',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(height: 10),
                    Text(
                      '  ${loadedStore.number}',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),

            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                child: RatingBarIndicator(
                  rating: loadedStore.rating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 30.0,
                  direction: Axis.horizontal,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  'We are in ${loadedStore.location}',
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text("Visit us:",
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 25,
                    )),
              ),
            ),

            Container(
              height: 300,
              width: 300,
              child: Maps(loadedStore.id),
            ),
          ],
        ),
      ),
    );
  }
}
