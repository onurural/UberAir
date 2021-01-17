import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.orange[900],
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.amber[900]])),
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Text(
              "ABOUT US",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              margin: EdgeInsets.only(left: 20, right: 20, top: 150),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                  "\nTurkey's plane ticket application UberAir offers you the best prices for domestic and overseas flights and ensures  booking tickets with one-click. It is getting you various airways and kinds of options to choose best for you. In these pandemic days, there are quite fewer flights and a lot of procedure to obey. As UberAir, we guide you to come through these difficult times. UberAir is founded by 3 talented entrepreneurs and it is developing day by day.\n"),
            ),
          ),
        ]),
      ),
    );
  }
}