import 'package:flutter/material.dart';

import 'package:uberAir/widget/search_airports_screen.dart';

class OpenAirPorts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchAirports());
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ),
      ),
    ));
  }
}
