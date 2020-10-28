import 'package:flutter/material.dart';

import 'widget/uberAir_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: "uberAir",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UberAir(),
    );
  }
}
