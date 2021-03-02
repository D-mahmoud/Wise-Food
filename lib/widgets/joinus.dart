import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JoinUsPage extends StatefulWidget {
  @override
  _JoinUsPageState createState() => _JoinUsPageState();
}



class _JoinUsPageState extends State<JoinUsPage> {

  _sendingMails() async {
  // const url = 'mailto:partenership@wisefood.org';
  // if (await canLaunch(url)) {
  //   await launch(url);
  // } else {
  //   throw 'Could not launch $url';
  // }
   if (await canLaunch("mailto:partenership@wisefood.org")) {
      await launch("mailto:partenership@wisefood.org");
    } else {
      throw 'Could not launch';
    }
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Us'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    '    Be a part of the Wise Food story.  Reach new customers, get more sales. ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              Container(child: Image(image: AssetImage('images/partner.png'))),
              RaisedButton(
                color: Colors.green[100],
                onPressed:
                _sendingMails,
                child: Text(
                  'Email Us',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ]),
      ),
    );
  }
}
