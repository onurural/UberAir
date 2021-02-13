import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: AppBar(
        title: Text("About Us"),
        
      ),
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/aboutus_bg.png"), fit: BoxFit.cover ),
      ),

        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 40),
          ),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              color: Colors.black26,
              margin: EdgeInsets.only(left: 20, right: 20, top: 150),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                  "\nTurkey's plane ticket application UberAir offers you the best prices for domestic and overseas flights and ensures  booking tickets with one-click. It is getting you various airways and kinds of options to choose best for you. In these pandemic days, there are quite fewer flights and a lot of procedure to obey. As UberAir, we guide you to come through these difficult times. UberAir is founded by 3 talented entrepreneurs and it is developing day by day.\n" , 
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                  ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
            "Uber",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent,
                fontSize: 40),
            textAlign: TextAlign.center,
          ),
          Text(
            "Air",
            style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.amberAccent,
                fontSize: 40),
            textAlign: TextAlign.center,
          ),
              ],
            ),
        ]),
      ),
    );
  }
}