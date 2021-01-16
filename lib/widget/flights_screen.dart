import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uberAir/models/flight.dart';
import 'package:uberAir/view_model/airport_view_model.dart';
import 'package:uberAir/widget/home_screen.dart';
import 'package:uberAir/widget/loading_screen.dart';

class FligthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String inboundCity;
    String outboundCity;
    String outboundDate;
    String inboundDate;

    return Scaffold(
        backgroundColor: Colors.blue[700],
        appBar: AppBar(
            backgroundColor: Colors.amber,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, MaterialPageRoute(builder: (context) => MyFlightInfoField())); // BURAYA BAK !!!
              },
              ) ,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              
              children: [
                Text("İzmir"),
                Icon(Icons.trending_flat),
                Text("Istanbul")
              ],
            ),
            bottomOpacity: 0.75,
            elevation: 10,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.flight_takeoff,
                        size: 30,
                      ),
                      Text(
                        "\tDeparture",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Departure Date",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        body: Container(child: Consumer<AirportViewModel>(
            builder: (BuildContext context, item, child) {
          item.getFlightData();
          inboundCity = item.inboundCity;
          outboundCity = item.outboundCity;
          inboundDate = item.inboundDate.substring(0, 10);
          print("INBOUND DATE : !!!!!!!$inboundDate");
          outboundDate = item.outboundDate.substring(0, 10);
          Future<Flights> fligths = item.getFlights(
              inboundCity, outboundCity, outboundDate, inboundDate);

          return FutureBuilder<Flights>(
            future: fligths,
            builder: (context, snapshot) {
              // Future.delayed(Duration(milliseconds: 1000), () {});

              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data.quotes.length == 0) {
                  return Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Icon(Icons.error),
                        Text("We cant found any fligth ")
                      ]));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.quotes.length,
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
                                                  color: Colors
                                                      .amberAccent.shade700),
                                              child: Icon(
                                                Icons.flight,
                                              ))),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                            "${snapshot.data.carriers[index].name}",
                                            style:
                                                TextStyle(color: Colors.blue)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "08:35",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            SizedBox(width: 12),
                                            Text("1 sa 10 dk"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text("09:15",
                                                style: TextStyle(fontSize: 20))
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "${snapshot.data.quotes[index].outboundLeg.originId}",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Icon(Icons.trending_flat),
                                            Text(
                                                "${snapshot.data.places[index].cityName}",
                                                style: TextStyle(fontSize: 18)),
                                          ],
                                        ),
                                        Text(
                                            "Direct : ${snapshot.data.quotes[index].direct}",
                                            style: TextStyle(fontSize: 14)),
                                      ],
                                    )),
                                Container(
                                  child: Text(
                                      "${snapshot.data.quotes[index].minPrice} TRY"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              } else {
               // Future.delayed(Duration(seconds: 4)).whenComplete(() => LoadingPage());
                return MyFlightInfoField();
                

                // return Center(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text("No Connection with API"),
                //       Icon(Icons
                //           .signal_cellular_connected_no_internet_4_bar_outlined)
                //     ],
                //   ),
                // );
              }
            },
          );
        })));
  }
}
