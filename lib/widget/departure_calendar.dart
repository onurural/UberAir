import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:uberAir/view_model/calendar_view_model.dart';

class DepartureCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CalendarController _calendarController = new CalendarController();
    return Scaffold(
        appBar: AppBar(
          title: Text("Departure / Return ",
              style: TextStyle(color: Colors.black)),
          centerTitle: false,
          actions: [
            Consumer<CalendarViewModel>(
                builder: (context, calendarViewModel, child) {
              return IconButton(
                  icon: Icon(
                    Icons.done_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  });
            })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<CalendarViewModel>(builder: (context, calendar, child) {
                return Center(child: calendar.buildDepartureCalendar(_calendarController));
              }),
            ],
          ),
        ));
  }
}