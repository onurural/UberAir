import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uberAir/locator.dart';
import 'package:uberAir/view_model/passenger_list_view_model.dart';
import 'package:uberAir/widget/splash_screen.dart';
import 'package:uberAir/widget/uberAir_widget.dart';
import 'database/db.dart';
import 'view_model/airport_view_model.dart';
import 'view_model/authentication_view_model.dart';
import 'view_model/calendar_view_model.dart';
import 'view_model/search_view_model.dart';

void main() async {
  setUpLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    // Database().fillMap();
    // Database().fillDB();
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Firebase has an error");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "uberAir",
                theme: ThemeData(primarySwatch: Colors.amber),
                home: Splash()),
            providers: [
              ChangeNotifierProvider<AirportViewModel>(
                  create: (context) => locator<AirportViewModel>()),
              ChangeNotifierProvider<ItemViewModel>(
                  create: (context) => locator<ItemViewModel>()),
              ChangeNotifierProvider<SearchViewModel>(
                  create: (context) => locator<SearchViewModel>()),
              ChangeNotifierProvider<CalendarViewModel>(
                  create: (context) => locator<CalendarViewModel>()),
              ListenableProvider<AuthenticationViewModel>(
                create: (_) => AuthenticationViewModel(FirebaseAuth.instance),
              ),
              StreamProvider(
                create: (context) =>
                    context.read<AuthenticationViewModel>().authState,
              )
            ],
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
