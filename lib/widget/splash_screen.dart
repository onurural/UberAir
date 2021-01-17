import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uberAir/widget/uberAir_widget.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  SpinKitHourGlass spinkit;
  @override
  void initState() {
    super.initState();

     spinkit = SpinKitHourGlass(
      color: Colors.amber,
      size: 50.0,
      controller: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 3000)),
    );

    Future.delayed(const Duration(seconds: 4), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UberAir()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/splash_bg.jpg"), fit: BoxFit.cover ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              spinkit,
              SizedBox(
                height: 25,
              ),
              
              Row(
                children: [
                  SizedBox(
                    width: 110,
                  ),
                  Text(
            "Uber",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent,
                fontSize: 60),
            textAlign: TextAlign.center,
          ),
          Text(
            "Air",
            style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.amberAccent,
                fontSize: 60),
            textAlign: TextAlign.center,
          ),
                ],
              ),
            ],
        ),
      ),
      ),
      
    );
  }
}