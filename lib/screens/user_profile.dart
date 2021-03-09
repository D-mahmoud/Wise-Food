import 'package:flutter/material.dart';
import 'package:wisefood/widgets/drawer.dart';
import 'package:wisefood/widgets/stores/nearBy.dart';
import 'dart:ui' as ui;

class UserProfile extends StatefulWidget {
  UserProfile(this._userName, this._email);
  final _userName;
  final _email;

  // newuserprofileprofile({
  //   Key key,
  // }) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      drawer: AppDrawer(),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 10.0),
            child: Transform.rotate(
              angle: 0.0,
              child:
                  SizedBox(
                width: 412.0,
                height: 907.0,
                child: Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(20.2, 70.5),
                      child:
                          Text(
                        ' Your Personal Information:',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 20,
                          letterSpacing: -0.15,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(40.2, 120.5),
                      child:
                          Text(
                        'Username',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 20,
                          color: Colors.green,
                          letterSpacing: -0.15,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(33.2, 200.1),
                      child:
                          Text(
                        'Email',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 20,
                          color: Colors.green,
                          letterSpacing: -0.15,
                                                    fontStyle: FontStyle.italic,

                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(33.2, 150.1),
                      child:
                          Text(
                        ' ${widget._userName} ',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 17,
                          color: const Color(0xff242134),
                          letterSpacing: -0.17,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(33.2, 230.7),
                      child:
                          Text(
                        ' ${widget._email} ',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 17,
                          color: const Color(0xff242134),
                          letterSpacing: -0.17,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(133.2, 830.4),
                      child: Container(
                        width: 147.2,
                        height: 5.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: const Color(0xffd8d9dd),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(71.0, 10),
                      child: SizedBox(
                          width: 271.0,
                          child:
                            
                              Text(
                            'Hello ${widget._userName} ',
                            style: TextStyle(
                                fontSize: 40,
                                foreground: Paint()
                                  ..shader = ui.Gradient.linear(
                                    const Offset(0, 20),
                                    const Offset(150, 20),
                                    <Color>[
                                      Colors.green,
                                      Colors.greenAccent,
                                    ],
                                  )),
                          )),
                    ),
                    Transform.translate(
                      offset: Offset(33.2, 300),
                      child: Text("All Nearby Restaurants:")
                    ),
                    Transform.translate(
                      offset: Offset(33.2, 320),
                      child: SizedBox(
                          width: 271.0,
                          child: Container(
                            child: Maps2(),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
