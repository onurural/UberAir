import 'dart:convert';
import 'package:uberAir/models/places.dart';
import 'package:http/http.dart' as http;

class AirportApiClient {
  static const _api_key = "ea187fa0a8msh9348745ba0d3c5fp1bbfe7jsn9f65d92822b9";
  static const String _baseUrl =
      "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com";
  Map<String, String> headers = {
    "x-rapidapi-key": _api_key,
    "x-rapidapi-host": _baseUrl,
    "content-type": "application/json",
  };

  Future<Place> fetchAirport(String city) async {
    final response = await http.get(
        "https://rapidapi.p.rapidapi.com/apiservices/autosuggest/v1.0/UK/GBP/en-GB/?query=$city",
        headers: headers);
    if (response.statusCode == 200) {
      return Place.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }

  // final _dio = Dio(BaseOptions(
  //     contentType: "application/json",
  //     baseUrl:
  //         'https://rapidapi.p.rapidapi.com/apiservices/autosuggest/v1.0/UK/GBP/en-GB/',
  //     headers: {'x-rapidapi-key': _api_key, 'x-rapidapi-host': _baseUrl}));

  // Future<List<Place>> searchAirports(String city) async {
  //   final response = await _dio.get('', queryParameters: {'query': 'ankara'});
  //   var places = List<Place>();
  //   if (response.statusCode != 200) {
  //     throw Exception(
  //         'error on search airport method status code:${response.statusCode}');
  //   }
  //   var placesJson = json.decode(response.data);
  //   for (var placeJson in placesJson) {
  //     places.add(Place.fromJson(placeJson));
  //   }
  //   print(places);
  //   return places;
  // }
}
