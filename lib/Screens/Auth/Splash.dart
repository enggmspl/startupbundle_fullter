// import 'package:flutter/material.dart';

// class Splash extends StatefulWidget {
//   @override
//   SplashPageState createState() => SplashPageState();
// }

// class SplashPageState extends State<Splash> {
//   // final scaffoldKey = GlobalKey<ScaffoldState>();
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Splash",
//           ),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(0),
//           child: Center(
//             child: Form(
//               autovalidate: true,
//               key: formkey,
//               child: SizedBox.expand(
//                   // -> 01

//                   ),
//             ),
//           ),
//         ));
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:startup_bundle_flutter/Screens/Auth/Login.dart';
import 'package:startup_bundle_flutter/Screens/Auth/SwiperScreen.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => SwiperScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(),
    );
  }
}
