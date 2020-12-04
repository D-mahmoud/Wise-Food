import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'store_profile.dart';

class MenuTile extends StatelessWidget {
  final String image;
  final String text;
  

  MenuTile({this.image, this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Card(
          elevation: 5,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 20,
                ),
              ),
            ),
            FlatButton(
                color: Colors.green[200],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StoreProfile()),
                  );
                },
                child: Text(
                  'Start Exploring',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ))
          ])),
    );
  }
}
