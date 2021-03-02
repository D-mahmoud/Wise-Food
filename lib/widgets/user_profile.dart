import 'package:flutter/material.dart';
import 'package:wisefood/widgets/drawer.dart';

class UserProfile extends StatefulWidget {
  final _userName;
  final _email;
  UserProfile(this._userName, this._email);
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
        title: Text("My Profile"),
      ),
      drawer: AppDrawer(),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 10.0),
            child: Transform.rotate(
              angle: 0.0,
              child:
                  // Adobe XD layer: 'profile - settings' (group)
                  SizedBox(
                width: 412.0,
                height: 907.0,
                child: Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(20.2, 70.5),
                      child:
                          // Adobe XD layer: 'text' (text)
                          Text(
                        'Personal Information',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 20,
                          color: Colors.green[200],
                          letterSpacing: -0.15,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(40.2, 100.5),
                      child:
                          // Adobe XD layer: 'text' (text)
                          Text(
                        'Username',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 20,
                          color: Colors.green[200],
                          letterSpacing: -0.15,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(33.2, 200.1),
                      child:
                          // Adobe XD layer: 'text' (text)
                          Text(
                        'Email',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 20,
                          color: Colors.green[200],
                          letterSpacing: -0.15,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(33.2, 130.1),
                      child:
                          // Adobe XD layer: 'text' (text)
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
                      offset: Offset(33.2, 250.7),
                      child:
                          // Adobe XD layer: 'text' (text)
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
                      offset: Offset(133.2, 860.4),
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
                        child: Text(
                          'Hello ${widget._userName}! ',
                          style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 35,
                            color: const Color(0xff242134),
                            fontWeight: FontWeight.w700,
                            height: 1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
