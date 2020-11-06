import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uberAir/locator.dart';
import 'view_model/airport_view_model.dart';
import 'widget/uberAir_widget.dart';

void main()async{
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
            create: (_) => AirportViewModel())
      ],
    );
  }
}
