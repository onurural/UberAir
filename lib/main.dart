import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uberAir/locator.dart';
import 'package:uberAir/view_model/passenger_list_view_model.dart';
import 'package:uberAir/widget/uberAir_widget.dart';
import 'database/db.dart';
import 'view_model/airport_view_model.dart';
import 'view_model/calendar_view_model.dart';
import 'view_model/search_view_model.dart';

void main() async {
  setUpLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    // Database().fillMap();
    
    // Database().fillDB();
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text("Firebase has an error");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "uberAir",
                theme: ThemeData(primarySwatch: Colors.amber),
                home: UberAir()),
            providers: [
              ChangeNotifierProvider<AirportViewModel>(
                  create: (context) => locator<AirportViewModel>()),
              ChangeNotifierProvider<ItemViewModel>(
                  create: (context) => locator<ItemViewModel>()),
              ChangeNotifierProvider<SearchViewModel>(
                  create: (context) => locator<SearchViewModel>()),
              ChangeNotifierProvider<CalendarViewModel>(
                  create: (context) => locator<CalendarViewModel>()),
            ],
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}
