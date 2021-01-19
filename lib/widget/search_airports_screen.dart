import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uberAir/models/airport.dart';
import 'package:uberAir/models/places.dart';
import 'package:uberAir/view_model/airport_view_model.dart';
import 'package:uberAir/view_model/search_view_model.dart';

class SearchAirports extends SearchDelegate<Place> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<AirportViewModel>(
        builder: (context, airportViewModel, child) {
      Future<Airport> airportList;
      airportList = airportViewModel.getAirport(query);
      return FutureBuilder<Airport>(
          future: airportList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return Center(
                  child: Text("Data = null"),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.places.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        title: Text(
                          snapshot.data.places[index].placeId != null
                              ? snapshot.data.places[index].placeId
                              : "NULL",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(snapshot.data.places[index].countryId +
                            "   " +
                            snapshot.data.places[index].placeName),
                        trailing: Icon(Icons.flight_takeoff,
                            color: Colors.blueAccent),
                        onTap: () {
                          context.read<SearchViewModel>().setupFrom();
                          context.read<SearchViewModel>().setupTo();
                          var value = snapshot.data.places[index];
                          close(context, value);
                        });
                  },
                );
              }
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Center(child: Text(snapshot.error));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          });
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<AirportViewModel>(
        builder: (context, airportViewModel, child) {
      Future<Airport> airportList;
      airportList = airportViewModel.getAirport(query);
      return FutureBuilder<Airport>(
          future: airportList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return Center(
                  child: Text("Please enter airport for search"),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.places.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        title: Text(
                          snapshot.data.places[index].placeId != null
                              ? snapshot.data.places[index].placeId
                              : "NULL",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(snapshot.data.places[index].countryId +
                            "   " +
                            snapshot.data.places[index].placeName),
                        trailing: Icon(Icons.flight_takeoff,
                            color: Colors.blueAccent),
                        onTap: () {
                          var value = snapshot.data.places[index];
                          close(context, value);
                        });
                  },
                );
              }
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Center(child: Text(snapshot.error));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          });
    });
  }
}
