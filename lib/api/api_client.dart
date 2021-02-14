import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uberAir/models/airport.dart';
import 'package:http/http.dart' as http;
import 'package:uberAir/models/flight.dart';

class AirportApiClient {
  static const _api_key = "ea187fa0a8msh9348745ba0d3c5fp1bbfe7jsn9f65d92822b9";
  static const String _baseUrl =
      "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com";
  Map<String, String> _rapidAPIheaders = {
    "x-rapidapi-key": _api_key,
    "x-rapidapi-host": _baseUrl,
    "content-type": "application/json",
  };
  Map<String, String> _skyscannerHeaders = {
    "content-type": "application/json",
    "Connection": "keep-alive",
    "Accept-Encoding": "gzip, deflate, br",
    "Accept": "*/*",
    "Host": "<calculated when request is sent>",
  };
  Future<Flights> getDestinationID() async {
    final response = await http.get(
        "http://partners.api.skyscanner.net/apiservices/browseroutes/v1.0/FR/eur/en-US/us/anywhere/anytime/anytime?apikey=prtl6749387986743898559646983194",
        headers: _skyscannerHeaders);
    if (response.statusCode == 200) {
      debugPrint("${response.body}");
      return Flights.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Status code: ${response.statusCode}");
    }
  }

  Future<Flights> fetchFlights(String inboundCity, String outboundCity,
      String outboundDate, String inboundDate) async {
    print("inboundCity API : $inboundCity ");
    print("outboundCity API: $outboundCity ");
    print("inboundDate API : $inboundDate ");
    print("outboundDate API : $outboundDate ");
    try {
      if (inboundDate != null && outboundDate != null) {
        print("outboundCity API : $outboundCity");
        final response = await http.get(
            "http://partners.api.skyscanner.net/apiservices/browsedates/v1.0/TR/TRY/tur/$inboundCity/$outboundCity/$inboundDate/$outboundDate?apikey=prtl6749387986743898559646983194",
            headers: _skyscannerHeaders);
        if (response.statusCode == 200) {
          print(" RESPONSE BODY : ${response.body}");
          return Flights.fromJson(jsonDecode(response.body));
        } else {
          throw Exception("Failed to fetch flight ${response.statusCode}");
        }
      } else {
        final response = await http.get(
            "http://partners.api.skyscanner.net/apiservices/browsequotes/v1.0/TR/TRY/tur/$inboundCity/$outboundCity/anytime/anytime?apikey=prtl6749387986743898559646983194",
            headers: _skyscannerHeaders);
        if (response.statusCode == 200) {
          return Flights.fromJson(jsonDecode(response.body));
        } else {
          throw Exception("Failed to fetch flight ${response.statusCode}");
        }
      }
    } catch (e) {
      print("Failed to fetch flight $e");
    }
  }

  Future<Airport> fetchAirport(String city) async {
    try {
      final response = await http.get(
          "https://rapidapi.p.rapidapi.com/apiservices/autosuggest/v1.0/TR/TRY/tur/?query=$city",
          headers: _rapidAPIheaders);
      print("${response.statusCode}");
      if (response.statusCode == 200) {
        print("${response.body}");
        return Airport.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to fetch airports");
      }
    } catch (e) {
      print(" fetch airport hata $e");
    }
  }
}
