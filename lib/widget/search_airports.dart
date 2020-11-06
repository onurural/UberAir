import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:uberAir/models/airport.dart';
import 'package:uberAir/models/places.dart';
import 'package:uberAir/view_model/airport_view_model.dart';

class SearchAirports extends SearchDelegate<Airport> {
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
      Future<Place> airportList;
      airportList = airportViewModel.fetchAirport(query);
      return FutureBuilder<Place>(
          future: airportList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  ListTile(
                    title: Text(snapshot.data.placeId),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error));
            }
            return CircularProgressIndicator();
          });
    });
    // ListView.builder(
    //     itemCount: _places.length,
    //     itemBuilder: (context, index) {
    //       return Card(
    //         child: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //               children: [Text(_places[index].placeId), Text("text")]),
    //         ),
    //       );
    //     });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<AirportViewModel>(
        builder: (context, airportViewModel, child) {
      Future<Place> airportList;
      airportList = airportViewModel.fetchAirport(query);
      return FutureBuilder<Place> (
          future: airportList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  ListTile(
                    title: Text(snapshot.data.placeId),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error));
            }
            return CircularProgressIndicator();
          });
    });
  }
}
