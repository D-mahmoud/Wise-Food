import 'package:flutter/material.dart';
import 'package:wisefood/widgets/cusines.dart';
import 'package:wisefood/widgets/faq.dart';
import 'package:wisefood/widgets/help.dart';
import 'package:wisefood/widgets/joinus.dart';
import 'package:wisefood/widgets/user_profile.dart';
import 'package:wisefood/screens/recommend.dart';
import 'package:wisefood/screens/admin.dart';
import 'package:wisefood/widgets/settings.dart';
import 'package:wisefood/screens/signup.dart';
import 'package:wisefood/screens/signin.dart';
import 'package:wisefood/widgets/home.dart';
import 'package:wisefood/models/stores.dart';
import 'package:wisefood/models/users.dart';
import 'package:provider/provider.dart';

/// SHAHD AHO
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Stores(),
          ),
          ChangeNotifierProvider.value(
            value: Users(),
          ),
        ],
        child: MaterialApp(
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
            'recommend': (context) => RecommendPage(),
            'cuisines': (context) => CuisinePage(),
            'settings': (context) => SettingsPage(),
            'faqs': (context) => FAQPage(),
            'help': (context) => HelpPage(),
            'join us': (context) => JoinUsPage(),
            'admin': (context) => AdminPage(),
          },
        ));
  }
}
