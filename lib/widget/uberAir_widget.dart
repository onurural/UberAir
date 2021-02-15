import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'my_drawer.dart';


class UberAir extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/plane_bg.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: MyDrawer(),
        body: Center(
          
          child: Expanded(child: MyFlightInfoField()),
        ),
      ),
    );
  }
}
