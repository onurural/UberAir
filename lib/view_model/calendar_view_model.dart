import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarViewModel with ChangeNotifier {
  DateTime selectedDeparuteDate;
  DateTime selectedReturnDate;
  Widget buildDepartureCalendar(CalendarController calendarController) {
    return TableCalendar(
      calendarController: calendarController,
      startingDayOfWeek: StartingDayOfWeek.monday,
      onDaySelected: (day, event, holidays) {
        selectedDeparuteDate = day;
        setupDeparture();
        notifyListeners();
      },
    );
  }
  Widget buildReturnCalendar(CalendarController calendarController) {
    return TableCalendar(
      calendarController: calendarController,
      startingDayOfWeek: StartingDayOfWeek.monday,
      onDaySelected: (day, event, holidays) {
        selectedReturnDate = day;
        setupReturn();
        notifyListeners();
      },
    );
  }

  setupDeparture() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("selectedDepartureDate",
        selectedDeparuteDate.toString().substring(0, 10));
    notifyListeners();
  }
  setupReturn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("selectedReturnDate",
        selectedReturnDate.toString().substring(0, 10));
    notifyListeners();
  }
}
