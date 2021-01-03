import 'package:flutter/material.dart';

class FligthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text("Flights   26/21/2001 Departure"),
        ),
        body: Container(
          child: ListView.builder(
            
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 100,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, bottom: 16.0, left: 5),
                                  child: IconTheme(
                                      data: IconThemeData(
                                          color: Colors.amberAccent.shade700),
                                      child: Icon(
                                        Icons.flight,
                                      ))),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text("Pegasus",
                                    style: TextStyle(color: Colors.blue)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "08:35",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    SizedBox(width:15),
                                    Text("1 sa 10 dk"),
                                    SizedBox(width: 15,),
                                    Text("09:15", style: TextStyle(fontSize: 24))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("ADB"),
                                    SizedBox(width: 10,),
                                    Text("IST"),
                                  ],
                                ),
                              ],
                            )),
                        Container(child: Text("180 TL"),)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
