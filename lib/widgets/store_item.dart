import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisefood/providers/stores.dart';

class StoreItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeId = ModalRoute.of(context).settings.arguments as String;
    final loadedStore = Provider.of<Stores>(
      context,
      listen: false,
    ).findById(storeId);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(loadedStore.storeTitle),
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
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 10),
            //   width: double.infinity,
            //   child: Text(
            //     loadedStore.imageUrl,
            //     textAlign: TextAlign.center,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
