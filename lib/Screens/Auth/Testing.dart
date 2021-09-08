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
import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  @override
  TestingPageState createState() => TestingPageState();
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
Map<String, bool> values = {
  'Apple': false,
  'Banana': false,
  'Cherry': false,
  'Mango': false,
  'Orange': false,
};

class TestingPageState extends State<Testing> {
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  File _image;
  DateTime selectedDate = DateTime.now();
  void _loginFacebook() async {
    final facebookLogin = FacebookLogin();
// final result = await facebookLogin.logInWithReadPermissions(['email']);
    final result = await facebookLogin.logIn(['email']);
    print(result);
    // switch (result.status) {
    //   case FacebookLoginStatus.loggedIn:
    //     // _sendTokenToServer(result.accessToken.token);
    //     // _showLoggedInUI();
    //     break;
    //     // case FacebookLoginStatus.cancelledByUser:
    //     _showCancelledMessage();
    //     break;
    //   case FacebookLoginStatus.error:
    //     // _showErrorOnUI(result.errorMessage);
    //     break;
    // }
  }

  Future<void> _handleSignIn() async {
    try {
      final data = await _googleSignIn.signIn();
      print(data);
    } catch (error) {
      print(error);
    }
  }

  var tmpArray = [];

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(tmpArray);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    tmpArray.clear();
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(0),
          child: Center(
            child: Form(
              autovalidate: true,
              child: SizedBox.expand(
                  // -> 01
                  child: Column(children: <Widget>[
                // width: 440,

                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 32,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Color(0xffFDCF09),
                          child: _image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                    _image,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fitHeight,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(50)),
                                  width: 100,
                                  height: 100,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
                SignInButton(
                  Buttons.Facebook,
                  mini: true,
                  onPressed: () {
                    _loginFacebook();
                  },
                ),
                SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: () {
                    _handleSignIn();
                  },
                ),
                Text("${selectedDate.toLocal()}".split(' ')[0]),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select date'),
                ),
                RaisedButton(
                  child: Text(
                    " Get Selected Checkbox Items ",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: getCheckboxItems,
                  color: Colors.deepOrange,
                  textColor: Colors.white,
                  splashColor: Colors.grey,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                ),

                Expanded(
                  child: ListView(
                    children: values.keys.map((String key) {
                      return new CheckboxListTile(
                        title: new Text(key),
                        value: values[key],
                        activeColor: Colors.pink,
                        checkColor: Colors.white,
                        onChanged: (bool value) {
                          setState(() {
                            values[key] = value;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ] // mainAxisAlignment: MainAxisAlignment.center,
                      )),
            ),
          ),
        ));
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}

// 2831140187109832
