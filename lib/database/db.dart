import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class Database with ChangeNotifier {
  
  CollectionReference airlineUrl =
      FirebaseFirestore.instance.collection('airlineURL');
  final _firestoreInstance = FirebaseFirestore.instance;
  Map<String, String> airlineURL = new Map();

  fetchURLfromDB(String carrierName) async {
    try {
      var url =
          await _firestoreInstance.collection("URL").doc('$carrierName').get();
      
      return url;
    } catch (e) {
      print("Fetch URL error $e");
    }
  }
}
