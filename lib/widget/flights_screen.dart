import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uberAir/database/db.dart';
import 'package:uberAir/view_model/search_view_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uberAir/models/flight.dart';
import 'package:uberAir/view_model/airport_view_model.dart';

import 'upload_ticket_screen.dart';

class FligthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<SearchViewModel>(builder: (context, item, child) {
              return FutureBuilder<String>(
                future: _getInboundCityName(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text(
                    snapshot.data != null
                        ? "${snapshot.data} "
                        : "Select Airport",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  );
                },
              );
            }),
            Icon(Icons.trending_flat),
            Consumer<SearchViewModel>(builder: (context, item, child) {
              return FutureBuilder<String>(
                future: _getOutboundCityName(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text(
                    snapshot.data != null
                        ? "${snapshot.data} "
                        : "Select Airport",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  );
                },
              );
            }),
          ],
        ),
        bottomOpacity: 0.75,
        elevation: 10,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.flight_takeoff,
                    size: 30,
                  ),
                  Text(
                    "\tDeparture Date",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Consumer<SearchViewModel>(builder: (context, item, child) {
                    return FutureBuilder<String>(
                      future: _getDepartureDate(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return Text(
                          snapshot.data != null
                              ? "${snapshot.data.substring(0, 10)} "
                              : "Select Airport",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        );
                      },
                    );
                  })
                ],
              ),
            ])),
      ),
      body: Container(child: Consumer<AirportViewModel>(
          builder: (BuildContext context, item, child) {
        Future<Flights> fligths = item.getFlights();
        return FutureBuilder<Flights>(
            future: fligths,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  return ListView.builder(
                    itemCount: snapshot.data.quotes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            onTap: () async {
                              String _carrierName =
                                  snapshot.data.carriers[index].name;
                              String _tmpUrl = await _getUrl(_carrierName);
                              _tmpUrl = _tmpUrl.substring(0,_tmpUrl.length-1);
                              String _url = 'https:$_tmpUrl';
                              debugPrint("URL $_url");
                              _launchURL(_url).then((value) {
                                _showAlertDialog(context);
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: IconTheme(
                                            data: IconThemeData(
                                                color: Colors
                                                    .amberAccent.shade700),
                                            child: Icon(
                                              Icons.flight,
                                            )),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                            "${snapshot.data.carriers[index].name}",
                                            style:
                                                TextStyle(color: Colors.blue)),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Consumer<SearchViewModel>(builder:
                                                (context, item, child) {
                                              return FutureBuilder<String>(
                                                future: _getInboundCityName(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot snapshot) {
                                                  return Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "${snapshot.data}",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  );
                                                },
                                              );
                                            }),
                                            Expanded(
                                                flex: 1,
                                                child:
                                                    Icon(Icons.trending_flat)),
                                            Consumer<SearchViewModel>(builder:
                                                (context, item, child) {
                                              return FutureBuilder<String>(
                                                future: _getOutboundCityName(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot snapshot) {
                                                  return Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      "${snapshot.data}",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  );
                                                },
                                              );
                                            }),
                                          ],
                                        ),
                                      ),
                                      snapshot.data.quotes[index].direct
                                          ? Expanded(
                                              flex: 1,
                                              child: Text("Direct",
                                                  style:
                                                      TextStyle(fontSize: 14)),
                                            )
                                          : Expanded(
                                              flex: 1,
                                              child: Text("Not Direct",
                                                  style:
                                                      TextStyle(fontSize: 14)),
                                            ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Text(
                                            "${snapshot.data.quotes[index].minPrice} TRY"),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.star,
                                        ),
                                        color: context
                                                    .read<AirportViewModel>()
                                                    .isPressed ==
                                                true
                                            ? Colors.yellow
                                            : Colors.black,
                                        onPressed: () {
                                          context
                                              .read<AirportViewModel>()
                                              .onPressed();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text("No Flight"),
                  );
                }
              } else {
                return Center(
                  child: Text("No Flight"),
                );
              }
            });
      })),
    );
  }

  _showAlertDialog(BuildContext context) => showDialog(
        useRootNavigator: false,
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Did You Buy Ticket ? "),
          content: Text("If yes you can upload ticket to our system"),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TicketUploadScreen()));
                },
                child: Text("Yes")),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("No")),
          ],
        ),
      );
  _launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url, forceWebView: false,enableJavaScript: true);
      } else {
        print("cant launch URL");
      }
    } catch (e) {
      print("error on launch url $e");
    }
  }

  _getUrl(String carrirerName) async {
    var url = await Database().fetchURLfromDB(carrirerName);
    String urlString = url.data().toString().split(':')[2];
    return urlString;
  }

  Future<String> _getOutboundCityName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("outboundCityName");
  }

  Future<String> _getInboundCityName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("inboundCityName");
  }

  Future<String> _getDepartureDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("inboundDate");
  }
}
