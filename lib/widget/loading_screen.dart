import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uberAir/widget/flights_screen.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  SpinKitPouringHourglass spinkit;
  Future<String> inboundcity;
  @override
  void initState() {
    super.initState();
    spinkit = SpinKitPouringHourglass(
      color: Colors.black,
      size: 55, //SizeConfig.instance(context).getProportionateScreenHeight(55),
    );
    

    Future.delayed(const Duration(seconds: 4), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FligthScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/loading_bg.jpg"), fit: BoxFit.cover)),);
  }
}

// class LoadingScreen extends StatefulWidget {
//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {

//   SpinKitHourGlass spinkit;
//   @override
//   void initState() {
//     super.initState();

//      spinkit = SpinKitHourGlass(
//       color: Colors.amber,
//       size: 50.0,
//       controller: AnimationController(
//           vsync: this, duration: const Duration(milliseconds: 3000)),
//     );

//     // Future.delayed(const Duration(seconds: 4), () async {
//     //   Navigator.pop(
//     //       context, MaterialPageRoute(builder: (context) => FligthScreen()));
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage("assets/splash_bg.jpg"), fit: BoxFit.cover ),
//       ),

//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               spinkit,
//               SizedBox(
//                 height: 25,
//               ),

//               Row(
//                 children: [
//                   SizedBox(
//                     width: 110,
//                   ),
//                   Text(
//             "Uber",
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.amberAccent,
//                 fontSize: 60),
//             textAlign: TextAlign.center,
//           ),
//           Text(
//             "Air",
//             style: TextStyle(
//                 fontWeight: FontWeight.w300,
//                 color: Colors.amberAccent,
//                 fontSize: 60),
//             textAlign: TextAlign.center,
//           ),
//                 ],
//               ),
//             ],
//         ),
//       ),
//       ),

//     );
//   }
// }
