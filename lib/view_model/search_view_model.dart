import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uberAir/widget/search_airports_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchViewModel with ChangeNotifier {
  String airportIDFrom;
  String airportIDTo;
  String inboundCity;
  String outboundCity;
  Future<String> searchNPrintResultInbound(BuildContext context) async {
    return showSearch(context: context, delegate: SearchAirports())
        .then((value) {
      airportIDFrom = value.placeId;
      inboundCity = value.placeName;

      setupFrom();
      notifyListeners();
      return airportIDFrom;
    });
  }

  Future<String> searchNPrintResultOutbound(BuildContext context) async {
    return showSearch(context: context, delegate: SearchAirports())
        .then((value) {
      airportIDTo = value.placeId;
      outboundCity = value.placeName;
      setupTo();
      notifyListeners();
      return airportIDTo;
    });
  }

  setupFrom() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
        "inboundCity", airportIDFrom.substring(0, airportIDFrom.length - 4));
    prefs.setString("inboundCityName", inboundCity);

    notifyListeners();
  }

  setupTo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
        "outboundCity", airportIDTo.substring(0, airportIDTo.length - 4));
    print("outbound city güncellendi set ");
    prefs.setString("outboundCityName", outboundCity);

    notifyListeners();
  }
}
