import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class ListItem {
  Widget buildTitle(BuildContext context, String _title);
  Widget buildSubTitle(BuildContext context, String _subTitle);
  Widget buildTrailingAdult(BuildContext context);
}

class ItemViewModel with ChangeNotifier implements ListItem {
  int _indexAdult = 0;
  int _indexKid = 0;
  int _indexBaby = 0;
  int _indexOld = 0;
  int _indexStudent = 0;
  int _indexYoung = 0;
  fetchPassengerValue() {
    Map<String, int> passengerMap = Map();
    if (_indexAdult != 0) {
      passengerMap["Adult"] = _indexAdult;
    }
    if (_indexBaby != 0) {
      passengerMap["Baby"] = _indexBaby;
    }
    if (_indexKid != 0) {
      passengerMap["Kid"] = _indexKid;
    }
    if (_indexOld != 0) {
      passengerMap["Old"] = _indexOld;
    }
    if (_indexStudent != 0) {
      passengerMap["Student"] = _indexStudent;
    }
    if (_indexYoung != 0) {
      passengerMap["Young"] = _indexYoung;
    }

    return passengerMap;
  }

   readPassengerValue() async {
    try {
      Map<String, int> passengerMap = await fetchPassengerValue();
      return passengerMap;
    } catch (e) {
      print("Error $e");
    }
  }

  @override
  Widget buildSubTitle(BuildContext context, String _subTitle) {
    return Container(
      width: 150,
      height: 30,
      child: Text("($_subTitle)",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
    );
  }

  @override
  Widget buildTitle(BuildContext context, String _title) {
    return Container(
      width: 150,
      height: 30,
      child: Text("$_title",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
    );
  }

  @override
  Widget buildTrailingAdult(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.do_disturb_on_outlined),
          onPressed: () {
            if (_indexAdult > 0) {
              decrementAdult();
            } else {
              Fluttertoast.showToast(
                  msg: "Passenger number cannot below zero",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          iconSize: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "${_indexAdult.toString()}",
          style: TextStyle(fontSize: 30, color: Colors.amberAccent),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
          icon: Icon(Icons.add_box_outlined),
          onPressed: incrementAdult,
          iconSize: 30,
        ),
      ],
    ));
  }

  Widget buildTrailingKid(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.do_disturb_on_outlined),
          onPressed: () {
            if (_indexKid > 0) {
              decrementKid();
            } else {
              Fluttertoast.showToast(
                  msg: "Passenger number cannot below zero",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          iconSize: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "${_indexKid.toString()}",
          style: TextStyle(fontSize: 30, color: Colors.amberAccent),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
          icon: Icon(Icons.add_box_outlined),
          onPressed: incrementKid,
          iconSize: 30,
        ),
      ],
    ));
  }

  Widget buildTrailingBaby(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.do_disturb_on_outlined),
          onPressed: () {
            if (_indexBaby > 0) {
              decrementBaby();
            } else {
              Fluttertoast.showToast(
                  msg: "Passenger number cannot below zero",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          iconSize: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "${_indexBaby.toString()}",
          style: TextStyle(fontSize: 30, color: Colors.amberAccent),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
          icon: Icon(Icons.add_box_outlined),
          onPressed: incrementBaby,
          iconSize: 30,
        ),
      ],
    ));
  }

  Widget buildTrailingOld(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.do_disturb_on_outlined),
          onPressed: () {
            if (_indexOld > 0) {
              decrementOld();
            } else {
              Fluttertoast.showToast(
                  msg: "Passenger number cannot below zero",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          iconSize: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "${_indexOld.toString()}",
          style: TextStyle(fontSize: 30, color: Colors.amberAccent),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
          icon: Icon(Icons.add_box_outlined),
          onPressed: incrementOld,
          iconSize: 30,
        ),
      ],
    ));
  }

  Widget buildTrailingStudent(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.do_disturb_on_outlined),
          onPressed: () {
            if (_indexStudent > 0) {
              decrementStudent();
            } else {
              Fluttertoast.showToast(
                  msg: "Passenger number cannot below zero",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          iconSize: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "${_indexStudent.toString()}",
          style: TextStyle(fontSize: 30, color: Colors.amberAccent),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
          icon: Icon(Icons.add_box_outlined),
          onPressed: incrementStudent,
          iconSize: 30,
        ),
      ],
    ));
  }

  Widget buildTrailingYoung(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.do_disturb_on_outlined),
          onPressed: () {
            if (_indexYoung > 0) {
              decrementYoung();
            } else {
              Fluttertoast.showToast(
                  msg: "Passenger number cannot below zero",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          iconSize: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "${_indexYoung.toString()}",
          style: TextStyle(fontSize: 30, color: Colors.amberAccent),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
          icon: Icon(Icons.add_box_outlined),
          onPressed: incrementYoung,
          iconSize: 30,
        ),
      ],
    ));
  }

  incrementAdult() {
    _indexAdult++;
    notifyListeners();
  }

  incrementKid() {
    _indexKid++;
    notifyListeners();
  }

  incrementBaby() {
    _indexBaby++;
    notifyListeners();
  }

  incrementOld() {
    _indexOld++;
    notifyListeners();
  }

  incrementStudent() {
    _indexStudent++;
    notifyListeners();
  }

  incrementYoung() {
    _indexYoung++;
    notifyListeners();
  }

  decrementAdult() {
    _indexAdult--;
    notifyListeners();
  }

  decrementKid() {
    _indexKid--;
    notifyListeners();
  }

  decrementBaby() {
    _indexBaby--;
    notifyListeners();
  }

  decrementOld() {
    _indexOld--;
    notifyListeners();
  }

  decrementStudent() {
    _indexStudent--;
    notifyListeners();
  }

  decrementYoung() {
    _indexYoung--;
    notifyListeners();
  }

  buildTrailing(BuildContext context, String titleList) {
    if (titleList == "Adult") return buildTrailingAdult(context);
    if (titleList == "Kid") return buildTrailingKid(context);
    if (titleList == "Baby") return buildTrailingBaby(context);
    if (titleList == "Old") return buildTrailingOld(context);
    if (titleList == "Student") return buildTrailingStudent(context);
    if (titleList == "Young") return buildTrailingYoung(context);
  }
}
