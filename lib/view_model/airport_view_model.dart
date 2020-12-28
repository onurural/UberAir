import 'dart:core';
import 'package:flutter/material.dart';
import 'package:uberAir/api/airport_api_client.dart';
import 'package:uberAir/models/airport.dart';
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
  AirportState _state;
  Airport _airportList;
    set state(AirportState value) {
    _state = value;
    notifyListeners();
  }
  AirportState getState() => _state;

 Future<Airport>getAirport(String city) async {
    try {
       _state = AirportState.LoadingAirportState;
      this._airportList = await _airportApiClient.fetchAirport(city);
    _state = AirportState.LoadedAirportState;
    }catch(e){
      
    }
   
    return _airportList;
  }
}
