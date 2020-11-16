import 'package:flutter/material.dart';
import 'package:wisefood/cusines.dart';
import 'package:wisefood/faq.dart';
import 'package:wisefood/help.dart';
import 'package:wisefood/joinus.dart';
import 'package:wisefood/profile.dart';
// import 'package:wisefood/recommend.dart';
import 'package:wisefood/settings.dart';
import 'package:wisefood/signup.dart';
import 'package:wisefood/signin.dart';
import 'package:wisefood/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        'Home Page': (context) => HomePage(),
        'Sign Up': (context) => SignUpPage(),
        'Sign IN': (context) => SignInPage(),
        'profile': (context) => ProfilePage(),
        'cuisines': (context) => CuisinePage(),
        'settings': (context) => SettingsPage(),
        'faqs': (context) => FAQPage(),
        'help': (context) => HelpPage(),
        'join us': (context) => JoinUsPage()
      },
    );
  }
}
