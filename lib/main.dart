import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uberAir/locator.dart';
import 'package:uberAir/view_model/passenger_list_view_model.dart';
import 'package:uberAir/widget/uberAir_widget.dart';
import 'view_model/airport_view_model.dart';
import 'view_model/search_view_model.dart';

void main() async {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      ],
    );
  }
}
