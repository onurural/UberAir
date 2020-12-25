// To parse this JSON data, do
//
//     final airport = airportFromJson(jsonString);

import 'dart:convert';

import 'places.dart';

Airport airportFromJson(String str) => Airport.fromJson(json.decode(str));

String airportToJson(Airport data) => json.encode(data.toJson());

class Airport {
  Airport({
    this.places,
  });

  List<Place> places;
  

  factory Airport.fromJson(Map<String, dynamic> json) => Airport(
        places: json["Places"] == null
            ? null
            : List<Place>.from(json["Places"].map((x) => Place.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Places": places == null
            ? null
            : List<dynamic>.from(places.map((x) => x.toJson())),
      };
}
