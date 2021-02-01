import 'package:flutter/material.dart';
import 'package:wisefood/providers/stores.dart';
import 'package:provider/provider.dart' as provider;

class StoreProfile extends StatefulWidget {
  @override
  _StoreProfileState createState() => _StoreProfileState();
}

class _StoreProfileState extends State<StoreProfile> {
  @override
  Widget build(BuildContext context) {
    final storeID = ModalRoute.of(context).settings.arguments;
    final loadedStore = provider.Provider.of<Stores>(
      context,
      listen: false,
    ).findById(storeID);
    print(storeID);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedStore.storeTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedStore.image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$${loadedStore.number}',
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
            )
          ],
        ),
      ),
    );
  }
}
