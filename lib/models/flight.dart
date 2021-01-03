// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:uberAir/models/places.dart';
import 'package:uberAir/models/quote.dart';

import 'carrier.dart';
import 'currency.dart';
import 'dates.dart';

Flights welcomeFromJson(String str) => Flights.fromJson(json.decode(str));

String welcomeToJson(Flights data) => json.encode(data.toJson());

class Flights {
    Flights({
        this.quotes,
        this.carriers,
        this.places,
        this.currencies,
        this.dates,
    });

    List<Quote> quotes;
    List<Carrier> carriers;
    List<Place> places;
    List<Currency> currencies;
    Dates dates;

    factory Flights.fromJson(Map<String, dynamic> json) => Flights(
        quotes: List<Quote>.from(json["Quotes"].map((x) => Quote.fromJson(x))),
        carriers: List<Carrier>.from(json["Carriers"].map((x) => Carrier.fromJson(x))),
        places: List<Place>.from(json["Places"].map((x) => Place.fromJson(x))),
        currencies: List<Currency>.from(json["Currencies"].map((x) => Currency.fromJson(x))),
        dates: Dates.fromJson(json["Dates"]),
    );

    Map<String, dynamic> toJson() => {
        "Quotes": List<dynamic>.from(quotes.map((x) => x.toJson())),
        "Carriers": List<dynamic>.from(carriers.map((x) => x.toJson())),
        "Places": List<dynamic>.from(places.map((x) => x.toJson())),
        "Currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
        "Dates": dates.toJson(),
    };
}
