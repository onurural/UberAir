import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uberAir/widget/flights_screen.dart';


class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  SpinKitPouringHourglass spinkit;
  Future<String> inboundcity;
  @override
  void initState() {
    super.initState();
    spinkit = SpinKitPouringHourglass(
      color: Colors.black,
      size: 55, //SizeConfig.instance(context).getProportionateScreenHeight(55),
    );

    Future.delayed(const Duration(seconds: 4), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FligthScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/loading_bg.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height:
                    40, //SizeConfig.instance(context).getProportionateScreenHeight(40),
              ),
              Text(
                "We are looking for flights for you. \nPlease wait.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height:
                    180, //SizeConfig.instance(context).getProportionateScreenHeight(190),
              ),
              Center(
                heightFactor:
                    7, //SizeConfig.instance(context).getProportionateScreenHeight(7),
                child: spinkit,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("İzmir",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w800)),
                        Icon(
                          Icons.trending_flat,
                          size: 35,
                        ),
                        Text("İstanbul",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w800)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Gidiş Tarihi",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        Icon(
                          Icons.flight_takeoff,
                          size: 20,
                        ),
                        Text("Dönüş Tarihi", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("2 Yetişkin, 1 Çocuk",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}