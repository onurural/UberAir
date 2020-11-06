

import 'package:flutter/material.dart';


import 'my_flght_info_field_widget.dart';
import 'my_side_bar_menu_widget.dart';

class UberAir extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    
    return Container(
      decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/plane_bg.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
      //    appBar: AppBar(       
      //   centerTitle: true,
      //   title: Text("Uber Air",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
      // ),
        backgroundColor: Colors.transparent,
         drawer : MySideBarMenuWidget(),
     
      body: Center(
        
        child:MyFlightInfoField(),
      ),
      ),
     
    );
  }

}