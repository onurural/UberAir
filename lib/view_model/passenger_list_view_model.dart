import 'package:flutter/material.dart';

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

  @override
  Widget buildSubTitle(BuildContext context, String _subTitle) {
    return Container(
      width: 150,
      height: 25,
      child: Text("($_subTitle)",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }

  @override
  Widget buildTitle(BuildContext context, String _title) {
    return Container(
      width: 150,
      height: 50,
      child: Text("$_title",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
    );
  }

  @override
  Widget buildTrailingAdult(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.exposure_minus_1_sharp),
          onPressed: decrementAdult,
          iconSize: 30,
        ),
        Text(
          "${_indexAdult.toString()}",
          style: TextStyle(fontSize: 30, color: Colors.amberAccent),
        ),
        IconButton(
          icon: Icon(Icons.exposure_plus_1),
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
          icon: Icon(Icons.exposure_minus_1_sharp),
          onPressed: decrementKid,
          iconSize: 30,
        ),
        Text(
          "${_indexKid.toString()}",
          style: TextStyle(fontSize: 30, color: Colors.amberAccent),
        ),
        IconButton(
          icon: Icon(Icons.exposure_plus_1),
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
          icon: Icon(Icons.exposure_minus_1_sharp),
          onPressed: decrementBaby,
          iconSize: 30,
        ),
        Text(
          "${_indexBaby.toString()}",
          style: TextStyle(fontSize: 30, color: Colors.amberAccent),
        ),
        IconButton(
          icon: Icon(Icons.exposure_plus_1),
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
          icon: Icon(Icons.exposure_minus_1_sharp),
          onPressed: decrementOld,
          iconSize: 30,
        ),
        Text(
          "${_indexOld.toString()}",
          style: TextStyle(fontSize: 30, color: Colors.amberAccent),
        ),
        IconButton(
          icon: Icon(Icons.exposure_plus_1),
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
          icon: Icon(Icons.exposure_minus_1_sharp),
          onPressed: decrementStudent,
          iconSize: 30,
        ),
        Text(
          "${_indexStudent.toString()}",
          style: TextStyle(fontSize: 30, color: Colors.amberAccent),
        ),
        IconButton(
          icon: Icon(Icons.exposure_plus_1),
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
          icon: Icon(Icons.exposure_minus_1_sharp),
          onPressed: decrementYoung,
          iconSize: 30,
        ),
        Text(
          "${_indexYoung.toString()}",
          style: TextStyle(fontSize: 30, color: Colors.amberAccent),
        ),
        IconButton(
          icon: Icon(Icons.exposure_plus_1),
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
