import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
      ),
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/aboutus_bg.png"), fit: BoxFit.cover ),
      ),
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
          ),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              color: Colors.black26,
              margin: EdgeInsets.only(left: 20, right: 20, top: 150),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                  "\nWhat we do with the information we collect? The short answer is: Provide you with an amazing set of products and services that we relentlessly imrpove. Here are some of the ways we do that:\n \n - develop, operate, improve our products and services.\n \n - personalize the services, customizing the content we show you. (including ads)\n \n - monitor and analyze trends and usage. \n \n - send you communications, including by email. For example, promotional offer that we think may interest you\n",
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


