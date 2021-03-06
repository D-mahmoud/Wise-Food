import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:// Text("loading"),
         Image.asset(
                        "images/logo.png",
                        alignment: Alignment.topCenter,
                        fit: BoxFit.contain,
                      ),
      ),
    );
  }
}
