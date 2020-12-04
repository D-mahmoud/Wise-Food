import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageeState createState() => _HomePageeState();
}

class _HomePageeState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Home'),
              onTap: () => Navigator.pushNamed(context, 'home'),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () => Navigator.pushNamed(context, 'profile'),
            ),
            ListTile(
              title: Text('Sign Up'),
              onTap: () => Navigator.pushNamed(context, 'Sign Up'),
            ),
            ListTile(
              title: Text('Sign IN'),
              onTap: () => Navigator.pushNamed(context, 'Sign IN'),
            ),
            ListTile(
              title: Text('Recommendations'),
              onTap: () => Navigator.pushNamed(context, 'recommend'),
            ),
            ListTile(
              title: Text('Cuisines'),
              onTap: () => Navigator.pushNamed(context, 'cuisines'),
            ),
            ListTile(
              title: Text('Join Us'),
              onTap: () => Navigator.pushNamed(context, 'join us'),
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () => Navigator.pushNamed(context, 'settings'),
            ),
            ListTile(
              title: Text('FAQs'),
              onTap: () => Navigator.pushNamed(context, 'faqs'),
            ),
            ListTile(
              title: Text('Help'),
              onTap: () => Navigator.pushNamed(context, 'help'),
            ),
              ListTile(
              title: Text('Admin'),
              onTap: () => Navigator.pushNamed(context, 'admin'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        ///adding image as background fpor our app
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/image_2.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.dstATop),
                ///dealing with image opacity to write on top of it or add containers
          ),
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 25, right: 25),
                  child: Container(
                    child: Text(
                      'WISE-FOOD      ',
                     
                      textAlign: TextAlign.center,
                     ///diffrent fonts to use when needed
                      style: TextStyle(
                        // fontFamily: 'MajorMono',
                        fontFamily: 'Pacifico',
                        //fontFamily: 'Texturina',
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            color: Colors.lightGreen,
                            blurRadius: 10.0,
                            offset: Offset(5.0, 5.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Container(
                //     height: animation.value,
                //     width: animation.value,
                //     child: Image(image: AssetImage('images/logo.png'))

                //     ),
                Padding(
                  padding: const EdgeInsets.only(top: 170),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: MaterialButton(
                      shape: CircleBorder(
                          side: BorderSide(
                              width: 2,
                              color: Colors.black,
                              style: BorderStyle.solid)),
///Make the button circular
                      // RaisedButton(
                      color: Colors.green,
                      onPressed: () =>
                          Navigator.pushNamed(context, 'recommend'),
                      child: Text(
                        'Explore',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'Pacifico'),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
