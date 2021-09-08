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
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginPageState extends State<Login> {
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  File _image;
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



 void _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _progress = false;
    });
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email.text);
    print(emailValid);
    if (_email.text == '' || _password.text == '') {
      return showAlertDialog(context, 'All Fields Requried');
    }
    if (emailValid == false) {
      return showAlertDialog(context, 'Email Not Valid');
    } else {
      DialogBuilder(context).showLoadingIndicator("");

      Map data = {
        "email": _email.text,
        "password": _password.text,
        "app": "string"
      };
      var response = await http.post(
          Uri.parse(
            "https://wondrfly.com/api/users/login",
          ),
          body: data);
      var loginData = json.decode(response.body);
      print(loginData);
      if (loginData['statusCode'] == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        prefs.setString('user_id', loginData['data']['id']);
        DialogBuilder(context).hideOpenDialog();
        print(loginData);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Home()));
        print('response is ????????' + response.body);
      } else {
        DialogBuilder(context).hideOpenDialog();
        // If the server did not return a 200 OK response,
        // then throw an exception.
        print(loginData['error']);
        return showAlertDialog(context, loginData['error']);
      }
    }
  }
  Future<void> _handleSignIn() async {
    try {
      final data = await _googleSignIn.signIn();
      print(data);
    } catch (error) {
      print(error);
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Padding(
          padding: EdgeInsets.all(0),
          child: Center(
            child: Form(
              autovalidate: true,
              key: formkey,
              child: SizedBox.expand(
                  // -> 01
                  child: Column(children: <Widget>[
  Padding(
                    padding: EdgeInsets.only(right: 20, top: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SignUp()));
                          },
                          child: Text('Welcome Back',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 27,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ],
                    )),
                  
                // width: 440,
                Container(
                    margin: EdgeInsets.fromLTRB(20, 90, 20, 30),
                    height: 70,
                    // width: 200,
                    child: TextFormField(
                      style: TextStyle(color: Colors.grey),
                      controller: _email,
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //     borderSide: new BorderSide(
                          //         color: Colors.red, width: 5.0)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey, width: 2.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey, width: 2.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          labelText: "Email"),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Requried *"),
                        EmailValidator(errorText: "Not a Valid Email")
                      ]),
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                    height: 70,
                    // width: 200,
                    child: TextFormField(
                        style: TextStyle(color: Colors.grey),
                        controller: _password,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey, width: 2.0),
                          ),
                          // hintText: 'username@mail.com',
                          labelText: 'Password',
                          // hintStyle: TextStyle(color: Colors.white),
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 20),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: _toggle,
                          ),
                        ),
                        obscureText: _obscureText,
                        validator: validatePass)),

                InkWell(
       


          child: 
Container(
   margin: EdgeInsets.fromLTRB(00, 70, 00, 00),
  alignment: Alignment.center,
      child:              new Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          color:Color(int.parse("0xff53B2E8")),
        
          ),
      height: 60,
      width: 200,
     ),
                  onTap: () {
                    _login();
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => Home()));
                  },
                ),

                Padding(
                    padding: EdgeInsets.only( top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ForgotPassword()));
                          },
                          child: Text('Forgot Password',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only( top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      
                        Text('Not a member yet? ',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                 )),
                                   InkWell(
                          onTap: () {
                           Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp()));
                          },
                          child: Text(' SIGN up',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                  decoration: TextDecoration.underline,
                                 )),
                        ),
                      ],
                    )),
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

showAlertDialog(BuildContext context, emailError) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(emailError),
    // content: Text("This is an alert message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class DialogBuilder {
  DialogBuilder(this.context);

  final BuildContext context;

  void showLoadingIndicator([String text]) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              backgroundColor: Colors.black87,
              content: LoadingIndicator(text: text),
            ));
      },
    );
  }

  void hideOpenDialog() {
    Navigator.of(context).pop();
  }
}

class LoadingIndicator extends StatelessWidget {
  LoadingIndicator({this.text = ''});

  final String text;

  @override
  Widget build(BuildContext context) {
    var displayedText = text;

    return Container(
        padding: EdgeInsets.all(16),
        color: Colors.black87,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _getLoadingIndicator(),
              _getHeading(context),
              _getText(displayedText)
            ]));
  }

  Padding _getLoadingIndicator() {
    return Padding(
        child: Container(
            child: CircularProgressIndicator(strokeWidth: 3),
            width: 32,
            height: 32),
        padding: EdgeInsets.only(bottom: 16));
  }

  Widget _getHeading(context) {
    return Padding(
        child: Text(
          'Please wait …',
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        padding: EdgeInsets.only(bottom: 4));
  }

  Text _getText(String displayedText) {
    return Text(
      displayedText,
      style: TextStyle(color: Colors.white, fontSize: 14),
      textAlign: TextAlign.center,
    );
  }
}