import 'package:flutter/material.dart';
import 'package:wisefood/screens/Edit_add_Store.dart';
import 'package:wisefood/screens/store_detail.dart';
import 'package:wisefood/widgets/cusines.dart';
import 'package:wisefood/screens/faq.dart';
import 'package:wisefood/screens/help.dart';
import 'package:wisefood/screens/joinus.dart';
import 'package:wisefood/screens/user_profile.dart';
import 'package:wisefood/screens/recommend.dart';
import 'package:wisefood/screens/admin.dart';
import 'package:wisefood/widgets/settings.dart';
import 'package:wisefood/screens/splash_screen.dart';
import 'package:wisefood/screens/auth_screen.dart';
import 'package:wisefood/widgets/home.dart';
import 'package:wisefood/providers/stores.dart';
import 'package:wisefood/providers/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
                //satreen dool 3amleen mashakl
                Provider.of<Auth>(context, listen: false).token,
                Provider.of<Auth>(context, listen: false).userId,
                []),
            update: (ctx, auth, stores) =>
                stores..receiveToken(auth, stores.items),
          ),
        ],
        child: Consumer<Auth>(
            builder: (ctx, auth, _) => MaterialApp(
                  theme: ThemeData(
                    primarySwatch: Colors.green,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                  ),
                  home: auth.isAuth
                      ? HomePage()
                      : FutureBuilder(
                          future: auth.autoLogin(),
                          builder: (ctx, autResSnapshot) =>
                              autResSnapshot.connectionState ==
                                      ConnectionState.waiting
                                  ? SplashScreen()
                                  : AuthScreen(),
                        ),
                  routes: {
                    'home': (context) => HomePage(),
                    'profile': (context) =>
                        UserProfile(auth.userName, auth.email),
                    'recommend': (context) => RecommendPage(auth.userName),
                    'cuisines': (context) => CuisinePage(),
                    'settings': (context) => SettingsPage(),
                    'faqs': (context) => FAQPage(),
                    'help': (context) => HelpPage(),
                    'join us': (context) => JoinUsPage(),
                    'admin': (context) => AdminPage(),
                    'store-detail': (context) => StoreDetail(),
                    'edit-store': (context) => EditStore(),
                  },
                )));
  }
}
