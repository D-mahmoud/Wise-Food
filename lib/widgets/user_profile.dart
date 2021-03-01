import 'package:flutter/material.dart';
// import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefood/widgets/drawer.dart';

class newuserprofileprofile extends StatefulWidget {
   final _userName;
   final _email;
  newuserprofileprofile(this._userName,this._email);
  // newuserprofileprofile({
  //   Key key,
  // }) : super(key: key);

  @override
  _newuserprofileprofileState createState() => _newuserprofileprofileState();
}

class _newuserprofileprofileState extends State<newuserprofileprofile> {
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
                      offset: Offset(0.0, 14.6),
                      child: SvgPicture.string(
                        _svg_5gckna,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(132.1, 120.9),
                      child: Container(
                        width: 145.0,
                        height: 145.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                          color: const Color(0xfff3f5f9),
                        ),
                      ),
                    ),
                    // Transform.translate(
                    //   offset: Offset(154.0, 53.8),
                    //   child: Text(
                    //     'MY PROFILE',
                    //     style: TextStyle(
                    //       fontFamily: 'SF Pro Text',
                    //       fontSize: 13,
                    //       color: const Color(0xff242134),
                    //       letterSpacing: 1.3,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //     textAlign: TextAlign.left,
                    //   ),
                    // ),
                    Transform.translate(
                      offset: Offset(347.4, 38.5),
                      child: SizedBox(
                        width: 51.0,
                        height: 51.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 50.5,
                              height: 50.5,
                              decoration: BoxDecoration(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(33.2, 494.5),
                      child:
                          // Adobe XD layer: 'text' (text)
                          Text(
                        'Username',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 15,
                          color: const Color(0x4d223269),
                          letterSpacing: -0.15,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(33.2, 579.1),
                      child:
                          // Adobe XD layer: 'text' (text)
                          Text(
                        'Email',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 15,
                          color: const Color(0x4d223269),
                          letterSpacing: -0.15,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(33.2, 523.1),
                      child:
                          // Adobe XD layer: 'text' (text)
                          Text(' ${widget._userName} ',
                        // 'niculici.victor',
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
                      offset: Offset(33.2, 607.7),
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
                      offset: Offset(71.0, 279.1),
                      child: SizedBox(
                        width: 271.0,
                        child: Text(
                         ' ${widget._userName} ',
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

const String _svg_5gckna =
    '<svg viewBox="-0.2 29.6 412.1 892.3" ><defs><filter id="shadow"><feDropShadow dx="0" dy="30" stdDeviation="30"/></filter></defs><path transform="translate(-0.19, 29.61)" d="M 0 0 L 412.0728149414063 0 L 412.0728149414063 892.2750244140625 L 0 892.2750244140625 L 0 0 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
