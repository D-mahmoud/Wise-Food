import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:wisefood/widgets/drawer.dart';

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
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
//rawan2
    animation = Tween<double>(begin: 0, end: 100).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
  }

//rawan
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        ///adding image as background fpor our app
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/image_2.jpg'),
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
                  padding: const EdgeInsets.only(top: 50, right: 18),
                  child: Container(
                    child: Text(
                      'WISE    FOOD      ',

                      textAlign: TextAlign.center,

                      ///diffrent fonts to use when needed
                      style: TextStyle(
                        // fontFamily: 'MajorMono',
                        //fontFamily: 'Pacifico',
                        fontFamily: 'Texturina',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: animation.value,
                  width: animation.value,
                  child: MaterialButton(
                    shape: CircleBorder(
                        side: BorderSide(
                            width: 1,
                            color: Colors.black,
                            style: BorderStyle.solid)),

                    ///Make the button circular
                    // RaisedButton(
                    color: Colors.green,
                    onPressed: () => Navigator.pushNamed(context, 'recommend'),
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Container(
                    width: 100,
                    height: 100,
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
