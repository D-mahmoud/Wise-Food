import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'store_profile.dart';

class MenuTile extends StatefulWidget {
  final String image;
  final String text;

  MenuTile({this.image, this.text});

  @override
  _MenuTileState createState() => _MenuTileState();
}

class _MenuTileState extends State<MenuTile> {
  @override
  Widget build(BuildContext context) {
    Set<String> savedWords = Set<String>();
    bool alreadySaved = savedWords.contains(this.widget.text);

    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Card(
          elevation: 5,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Align(
                alignment: Alignment.centerRight,
                child: new IconButton(
                  icon: new Icon(
                      // alreadySaved ? Icons.favorite : Icons.favorite_border,
                      // color: alreadySaved ? Colors.red : null,
                      Icons.favorite_border),
                  onPressed: () {
                    if (alreadySaved) {
                      savedWords.remove(this.widget.text);
                      print('saved');
                      print(this.widget.text);
                    } else {
                      savedWords.add(this.widget.text);
                     print(this.widget.text);

                    }
                    // setState(() {
                    //   if (alreadySaved) {
                    //     savedWords.remove(this.widget.text);
                    //   } else {
                    //     savedWords.add(this.widget.text);
                    //   }
                    // });
                  },
                )),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  widget.image,
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
                widget.text,
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
