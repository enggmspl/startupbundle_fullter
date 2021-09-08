import 'package:flutter/material.dart';
import 'package:startup_bundle_flutter/Screens/HomeScreens/Home.dart';
import 'package:webview_flutter/webview_flutter.dart';
class PrivacyPolicy extends StatefulWidget {
  @override
  PrivacyPolicyPageState createState() => PrivacyPolicyPageState();
}



class PrivacyPolicyPageState extends State<PrivacyPolicy> {
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;

  String typeStatus = 'provider';

  String btnColor = '53B2E8';
  String validatePass(value) {
    print(value);
    if (value.isEmpty) {
      return "Requried";
    } else {
      return null;
    }
  }

  String validEmail(value) {}
  bool _progress = false;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }


void ChangeStatus(value){
  typeStatus=value;
  print(value);
    setState(() {
      typeStatus = value;
    });
  
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color:Color(int.parse("0xff53B2E8"))),
           onPressed: () => Navigator.of(context).pushReplacement(
               MaterialPageRoute(builder: (BuildContext context) => Home())),
         ),
        centerTitle: true,
      ),
        body:   WebView(
       initialUrl: 'http://13.54.226.124:4604/terms',
     ));
  }
}

// 2831140187109832
