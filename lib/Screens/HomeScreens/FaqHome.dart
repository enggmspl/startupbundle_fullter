import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:startup_bundle_flutter/Screens/Auth/ForgotPassword.dart';
import 'package:startup_bundle_flutter/Screens/Auth/SignUp.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:startup_bundle_flutter/Screens/Auth/Testing.dart';
import 'package:startup_bundle_flutter/Screens/HomeScreens/Home.dart';
import 'package:getwidget/getwidget.dart';
class FaqHome extends StatefulWidget {
  @override
  FaqHomePageState createState() => FaqHomePageState();
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class FaqHomePageState extends State<FaqHome> {
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  File _image;
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

  void _loginFacebook() async {
    final facebookLogin = FacebookLogin();

    final result = await facebookLogin.logIn(['email']);
    print(result);
  }

  Future<void> _handleSignIn() async {
    try {
      final data = await _googleSignIn.signIn();
      print(data);
    } catch (error) {
      print(error);
    }
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
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Text('Have A Question?',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          )),
      Container(
          margin: EdgeInsets.fromLTRB(20, 30, 20, 25),
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 3.0,
              ),
            ],
          ),
          // width: 200,
          child: TextFormField(
            style: TextStyle(color: Colors.grey),
            controller: _password,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              // hintText: 'username@mail.com',
              labelText: 'Search your question',
              // hintStyle: TextStyle(color: Colors.white),
              labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
              // suffixIcon: IconButton(
              //   icon: Icon(
              //    Icons.search,
              //     color: Colors.grey,

              //   ),
              //   onPressed: _toggle,

              // ),

              suffixIcon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.redAccent,
                ),
                child: new IconButton(
                    icon: new Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: null),
              ),
            ),
          )),
      Container(
        margin: EdgeInsets.fromLTRB(20, 00, 20, 25),
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {ChangeStatus('parent');},
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people_outline_rounded,
                      color:typeStatus=='parent'? Color(int.parse("0xff53B2E8")):Colors.grey,
                      size: 30.0,
                    ),
                    Text('Help for Parents',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontSize: 14,
                                               color:typeStatus=='parent'? Color(int.parse("0xff53B2E8")):Colors.grey,

                            fontWeight: FontWeight.bold)),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      //                   <--- left side
                                                                   color:typeStatus=='parent'? Color(int.parse("0xff53B2E8")):Colors.grey,

                      width: 4.0,
                    ),
                  ),
                ),
                height: 80,
                width: 160,
              ),
            ),
            InkWell(
              onTap: () {ChangeStatus('provider');},
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.business_rounded,
                                          color:typeStatus=='provider'? Color(int.parse("0xff53B2E8")):Colors.grey,

                      size: 30.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    Text('Help for Visitor',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontSize: 14,
                                                                         color:typeStatus=='provider'? Color(int.parse("0xff53B2E8")):Colors.grey,

                            fontWeight: FontWeight.bold)),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      //                   <--- left side
                                                              color:typeStatus=='provider'? Color(int.parse("0xff53B2E8")):Colors.grey,

                      width: 4.0,
                    ),
                  ),
                ),
                height: 80,
                width: 160,
              ),
            ),
          ],
        ),
        // width: 200,
      ),






      ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
    children: <Widget>[
     
      GFAccordion(
          title: 'Profile',
        content: 'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
      ),
      SizedBox(
        height: 10,
      ),
      GFAccordion(
          title: 'Program',
        content: 'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
      ),
      SizedBox(
        height: 10,
      ), GFAccordion(
          title: 'Help & Support',
        content: 'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
      ),
      SizedBox(
        height: 10,
      ), GFAccordion(
          title: 'Trust & Safety',
        content: 'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
      ),
      SizedBox(
        height: 10,
      ),
     
       ],
    ),
    ] // mainAxisAlignment: MainAxisAlignment.center,

                )));
  }
}

// 2831140187109832
