import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uberAir/view_model/search_view_model.dart';
import 'my_app_bar_widget.dart';
import 'open_calender_widget.dart';
import 'open_passenger_list_widget.dart';
import 'open_search_page_widget.dart';
import 'search_airports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyFlightInfoField extends StatelessWidget  {
  MyFlightInfoField();

  @override
  Widget build(BuildContext context) {
    Map<String, int> list = Map();
    return (Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          MyAppBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OpenCalender()));
                },
                child: Text("Departure",
                    style: TextStyle(color: Colors.amberAccent)),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OpenCalender()));
                },
                child:
                    Text("Return", style: TextStyle(color: Colors.amberAccent)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OpenCalender()));
                },
                child: Text(
                  "01\nJANUARY\n2020",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Icon(Icons.calendar_today, color: Colors.amberAccent),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OpenCalender()));
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
                child: Text("To", style: TextStyle(color: Colors.amberAccent)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<SearchViewModel>(builder: (context, item, child) {
                return FlatButton(
                  onPressed: () {
                    item.searchNPrintResultFrom(
                      context,
                    );
                  },
                  child: FutureBuilder<String>(
                    future: _readFromAirportID(),
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
              onPressed: () async {
                list = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OpenPassengerList(),
                  ),
                );
              
                // String s;
                debugPrint("Home Screen : ${list["Adult"]}");
                for (Object value in list.keys) {
                  print("KATEGORİ: $value  ${list["$value"]}");
                
                }
              },
              child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.amberAccent,
                  ),
                  title: list == null
                      ? Text("Select Passenger")
                      : Text("${list["Adult"]} "))),
          // Text("${list["Adult"]}")
          // ListView.builder(
          //     itemCount: list.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Column(
          //         children: [
          //           Text("sa"),
          //         ],
          //       );
          //     })
          // ListView.builder(
          //   itemCount: list.length,
          //   itemBuilder: (BuildContext context, int index){
          //     return Text("${list[index].passengerValue}");
          // }
          // )
          // )

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
  // Future<List<int>> _readPassengerValue(Future<List<String>> passengerValue) async {
  //   List<int> values = new List<int>();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   for (int i = 0; i < passengerValue.; i++) {
  //     values.add(prefs.getInt(passengerValue[i]));
  //   }
  //   return values;
  // }
}