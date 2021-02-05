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
import 'package:wisefood/providers/stores.dart';
import 'package:wisefood/providers/users.dart';
import 'package:wisefood/providers/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Auth(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProxyProvider<Auth, Stores>(
          create: (_) => Stores(
              Provider.of<Auth>(context, listen: true).token,
              Provider.of<Auth>(context, listen: true).userId, []),
          update: (ctx, auth, products) =>
              products..receiveToken(auth, products.items),
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
