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
List<String> savedWords = List<String>();
                    savedWords=['Mezcal'];

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
                       savedWords.contains(widget.text) ? Icons.favorite : Icons.favorite_border,
                       color: savedWords.contains(widget.text) ? Colors.red : null,),
                     // Icons.favorite_border),
                     
                  onPressed: () {
                    //bool alreadySaved = savedWords.contains(widget.text);
                     //setState(() {
                      if (savedWords.contains(widget.text)) {
                        savedWords.remove(widget.text);
                        print('save aslan');
                      } 
                      else {
                        savedWords.add(widget.text);
                        print('h save 7alan');
                      }

                    // });
                    //print(savedWords.length);

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
