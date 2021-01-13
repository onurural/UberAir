import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uberAir/api/api_client.dart';
import 'package:uberAir/models/flight.dart';
import '../locator.dart';

class Database {
  Map<String, String> placeMap = Map();
  final _firestoreInstance = FirebaseFirestore.instance;

  AirportApiClient _airportApiClient = locator<AirportApiClient>();
  Flights _flight = Flights();

  void fillMap() async {
    print("FILL MAP Çalıştı");
    _flight = await _airportApiClient.getDestinationID();
    for (int i = 0; i < _flight.places.length; i++) {
      placeMap["${_flight.places[i].placeId}"] = "${_flight.places[i].name}";
    }
  }

  void fillDB() {
    _firestoreInstance
        .collection("flightInfo")
        .doc("place")
        .set(placeMap)
        .then((value) => print("EKLENDİ"));
  }
}
