import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:uberAir/models/airport.dart';
import 'package:http/http.dart' as http;
import 'package:uberAir/models/flight.dart';

class AirportApiClient {
  static const _api_key = "ea187fa0a8msh9348745ba0d3c5fp1bbfe7jsn9f65d92822b9";
  static const String _baseUrl =
      "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com";
  Map<String, String> headers = {
    "x-rapidapi-key": _api_key,
    "x-rapidapi-host": _baseUrl,
    "content-type": "application/json",
  };
  fetchFlights(String inboundCity, String outboundCity, String outboundDate,
      String inboundDate) async {
    final response = await http.get(
        "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsedates/v1.0/US/USD/en-US/$inboundCity-sky/$outboundCity-sky/$outboundDate?inboundpartialdate=$inboundDate",
        headers: headers);
    if (response.statusCode == 200) {
      return Flights.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetch flight");
    }
  }

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
}
