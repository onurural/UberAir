import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uberAir/widget/search_airports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchViewModel with ChangeNotifier {
  String airportIDFrom;
  String airportIDTo;
  Future<String> searchNPrintResultFrom(BuildContext context) async {
    return showSearch(context: context, delegate: SearchAirports())
        .then((value) {
      airportIDFrom = value.placeId;
      setupFrom();
      notifyListeners();
      return airportIDFrom;
    });
  }

  Future<String> searchNPrintResultTo(BuildContext context) async {
    return showSearch(context: context, delegate: SearchAirports())
        .then((value) {
      airportIDTo = value.placeId;
      setupTo();
      notifyListeners();
      return airportIDTo;
    });
  }

  setupFrom() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
        "fromAirportID", airportIDFrom.substring(0, airportIDFrom.length - 4));
    notifyListeners();
  }

  setupTo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
        "toAirportID", airportIDTo.substring(0, airportIDTo.length - 4));
    notifyListeners();
  }
}
