import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uberAir/view_model/passenger_list_view_model.dart';
import 'package:uberAir/view_model/search_view_model.dart';
import 'my_app_bar_widget.dart';
import 'open_calender_widget.dart';
import 'open_passenger_list_widget.dart';
import 'open_search_page_widget.dart';
import 'search_airports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyFlightInfoField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Container(
      padding: EdgeInsets.all(20),
      child: Expanded(
        child: Column(
          children: [
            MyAppBar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OpenCalender()));
                  },
                  child: Text("Departure",
                      style: TextStyle(color: Colors.amberAccent)),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OpenCalender()));
                  },
                  child: Text("Return",
                      style: TextStyle(color: Colors.amberAccent)),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OpenCalender()));
                  },
                  child: Text(
                    "01\nJANUARY\n2020",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Icon(Icons.calendar_today, color: Colors.amberAccent),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OpenCalender()));
                  },
                  child: Text(
                    "01\nFEBRUARY\n2020",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      child: Divider(
                    thickness: 1,
                    color: Colors.amberAccent,
                  )),
                  Text("         "),
                  Expanded(
                      child: Divider(
                    thickness: 1,
                    color: Colors.amberAccent,
                  )),
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchAirports());
                  },
                  child: Text(
                    "From",
                    style: TextStyle(color: Colors.amberAccent),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchAirports());
                  },
                  child:
                      Text("To", style: TextStyle(color: Colors.amberAccent)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer<SearchViewModel>(builder: (context, item, child) {
                  return SizedBox(
                    width: 100,
                    child: FlatButton(
                      onPressed: () {
                        item.searchNPrintResultFrom(
                          context,
                        );
                      },
                      child: FutureBuilder<String>(
                        future: _readFromAirportID(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          return Text(
                            snapshot.data != null
                                ? snapshot.data
                                : "Select Airport",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w400),
                          );
                        },
                      ),
                    ),
                  );
                }),
                Icon(
                  Icons.flight,
                  color: Colors.amberAccent,
                ),
                Consumer<SearchViewModel>(builder: (context, item, child) {
                  return FlatButton(
                    onPressed: () {
                      item.searchNPrintResultTo(
                        context,
                      );
                    },
                    child: FutureBuilder<String>(
                      future: _readToAirportID(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return Text(
                          snapshot.data != null
                              ? snapshot.data
                              : "Select Airport",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w400),
                        );
                      },
                    ),
                  );
                })
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.amberAccent,
            ),
            FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OpenPassengerList(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child:
                        Icon(Icons.person, size: 40, color: Colors.amberAccent),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "\nSelect Passenger            ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.amberAccent,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 200,
                              child: Consumer<ItemViewModel>(
                                  builder: (context, item, child) {
                                return FutureBuilder(
                                    future: item.readPassengerValue(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<dynamic> snapshot) {
                                      return ListView.separated(
                                        addAutomaticKeepAlives: false,
                                        itemCount: snapshot.data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          String key = snapshot.data.keys
                                              .elementAt(index);
                                          return Text(
                                            "${snapshot.data[key]} $key ",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                Divider(
                                          color: Colors.amberAccent,
                                          thickness: 1,
                                        ),
                                      );
                                    });
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            TextButton(
              child: Text(
                'SEARCH',
                style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OpenSearchPage()));
              },
            ),
          ],
        ),
      ),
    ));
  }

  Future<String> _readFromAirportID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("fromAirportID");
  }

  Future<String> _readToAirportID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("toAirportID");
  }
}
