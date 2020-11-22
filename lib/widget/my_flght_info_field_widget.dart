import 'package:flutter/material.dart';

import 'my_app_bar_widget.dart';
import 'open_calender_widget.dart';
import 'open_passenger_list_widget.dart';
import 'open_search_page_widget.dart';
import 'search_airports.dart';

class MyFlightInfoField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              FlatButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchAirports());
                },
                child: Text(
                  "IST ",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
                ),
              ),
              Icon(
                Icons.flight,
                color: Colors.amberAccent,
              ),
              FlatButton(
               onPressed: () {
                  showSearch(context: context, delegate: SearchAirports());
                },
                child: Text(
                  "ADB",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.amberAccent,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OpenPassengerList()));
            },
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.amberAccent,
              ),
              title: Text('2 Student',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
            ),
          ),
          TextButton(
            child: const Text(
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
}
