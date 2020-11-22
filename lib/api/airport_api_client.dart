import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:uberAir/models/airport.dart';
import 'package:http/http.dart' as http;

class AirportApiClient {
  static const _api_key = "WRITE API KEY HERE";
  static const String _baseUrl =
      "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com";
  Map<String, String> headers = {
    "x-rapidapi-key": _api_key,
    "x-rapidapi-host": _baseUrl,
    "content-type": "application/json",
  };

  Future<Airport> fetchAirport(String city) async {
    final response = await http.get(
        "https://rapidapi.p.rapidapi.com/apiservices/autosuggest/v1.0/UK/GBP/en-GB/?query=$city",
        headers: headers);
    if (response.statusCode == 200) {
      debugPrint(response.body.toString());
      // return parseJson(response.body);
      
      return Airport.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }

  // List<Place> parseJson(String body) {
  //   final parsed = jsonDecode(body).cast<Map <String,dynamic>>();
  //   return parsed.map<Place>((json)=>Place.fromJson(json)).toList();
  // }
}
