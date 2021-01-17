import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key key}) : super(key: key);

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
              "PRIVACY POLICY ",
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
                  "\nWhat we do with the information we collect? The short answer is: Provide you with an amazing set of products and services that we relentlessly imrpove. Here are some of the ways we do that:\n \n - develop, operate, improve our products and services.\n \n - personalize the services, customizing the content we show you. (including ads)\n \n - monitor and analyze trends and usage. \n \n - send you communications, including by email. For example, promotional offer that we think may interest you\n"),
            ),
          ),
        ]),
      ),
    );
  }
}
