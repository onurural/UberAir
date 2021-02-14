import 'dart:core';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uberAir/api/api_client.dart';
import 'package:uberAir/models/airport.dart';
import 'package:uberAir/models/flight.dart';
import '../locator.dart';

enum AirportState {
  InitialAirportState,
  LoadingAirportState,
  LoadedAirportState,
  ErrorAirportState
}

class AirportViewModel with ChangeNotifier {
  AirportApiClient _airportApiClient = locator<AirportApiClient>();
  AirportViewModel() {
    _state = AirportState.InitialAirportState;
  }
  bool isPressed = false;
  bool isPop = false;
   onPop() {
    isPop = !isPop;
    notifyListeners();
  }
  onPressed() {
    isPressed = !isPressed;
    notifyListeners();
  }

  String inboundCity;
  String outboundCity;
  String inboundDate;
  String outboundDate;
  Flights _flight;
  AirportState _state;
  Airport _airportList;
  set state(AirportState value) {
    _state = value;
    notifyListeners();
  }

  AirportState getState() => _state;
  Future<Airport> getAirport(String city) async {
    try {
      _state = AirportState.LoadingAirportState;
      _airportList = await _airportApiClient.fetchAirport(city);
      _state = AirportState.LoadedAirportState;
    } catch (e) {}
    return _airportList;
  }

  void getFlightData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      inboundCity = prefs.getString("inboundCity");

      print("İnboundCity : $inboundCity");
      outboundCity = prefs.getString("outboundCity");

      print("outboundCity : $outboundCity");
      outboundDate = prefs.getString("outboundDate");
      print("outboundDate  : $outboundDate");
      outboundDate = outboundDate.substring(0, 10);
      inboundDate = prefs.getString("inboundDate");
      print("inboundDate : $inboundDate");
      inboundDate = inboundDate.substring(0, 10);
    } catch (e) {
      print("get Flights error: $e");
    }
  }

  Future<Flights> getFlights() async {
    String inboundCity;
    String outboundCity;
    String inboundDate;
    String outboundDate;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    inboundCity = prefs.getString("inboundCity");

    print("İnboundCity : $inboundCity");
    outboundCity = prefs.getString("outboundCity");

    print("outboundCity : $outboundCity");
    outboundDate = prefs.getString("outboundDate");
    print("outboundDate  : $outboundDate");
    outboundDate = outboundDate.substring(0, 10);
    inboundDate = prefs.getString("inboundDate");
    print("inboundDate : $inboundDate");
    inboundDate = inboundDate.substring(0, 10);

    _flight = await _airportApiClient.fetchFlights(
        inboundCity, outboundCity, outboundDate, inboundDate);

    return _flight;
  }
}
