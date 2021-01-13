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

  Future<Map> getFlightData() async {
    print("spden gelen datalar mape geçiliyor... ");
    Map dataMap = new Map();
    if (dataMap != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      inboundCity = prefs.getString("inboundCity");
      dataMap["inboundCity"] = inboundCity;
      outboundCity = prefs.getString("outboundCity");
      dataMap["ouboundCity"] = outboundCity;
      outboundDate = prefs.getString("outboundDate");
      dataMap["outboundDate"] = outboundDate;
      inboundDate = prefs.getString("inboundDate");
      dataMap["inboundDate"] = inboundDate;
      print("GEÇİLEN DEĞERLER ${dataMap["inboundCity"]}");

      return dataMap;
    } else {
      Map nullMap = new Map();
      String a = "boşbuAMK";
      nullMap["boşBuAmk"] = a;
      print("map == null");
      return nullMap;
    }
  }

  Future<Flights> getFlights(
      String inboundCity, outboundCity, outboundDate, inboundDate) async {
    print("apiden veri çekiliyor 4");
    _flight = await _airportApiClient.fetchFlights(
        inboundCity, outboundCity, outboundDate, inboundDate);

    return _flight;
  }
}
