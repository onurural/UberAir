import 'dart:core';
import 'package:flutter/material.dart';
import 'package:uberAir/api/airport_api_client.dart';
import 'package:uberAir/models/places.dart';
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
  // AirportRepository _airportRepository = locator<AirportRepository>();
  AirportState _state;
  Place _airportList;
    set state(AirportState value) {
    _state = value;
    notifyListeners();
  }
  AirportState getState() => _state;
   Future fetchAirport(String city) async {
    try {
       _state = AirportState.LoadingAirportState;
      this._airportList = await _airportApiClient.fetchAirport(city);
    _state = AirportState.LoadedAirportState;
    }catch(e){
      
    }
   
    return _airportList;
  }

  // AirportRepository airportRepository = locator<AirportRepository>();
  // Place placeList;
  // Airport airport;
  // AirportState _state;

  // AirportViewModel() {
  //   Future
  //   airport = Airport();
  //   state = AirportState.InitialAirportState;
  // }

  // AirportState get state => _state;



  // Future airportFetch(String placeName) async {
  //   try {
  //     state = AirportState.LoadingAirportState;
  //     placeList = await airportRepository.getAirport(placeName);
  //     state = AirportState.LoadedAirportState;

  //   } catch (e) {
  //     state = AirportState.ErrorAirportState;

  //   }
  //   return placeList;
  // }
}
