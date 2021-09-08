import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:startup_bundle_flutter/Screens/Auth/Login.dart';
import 'package:startup_bundle_flutter/Screens/Auth/SignUp.dart';
import 'package:startup_bundle_flutter/Screens/Auth/VerifyOtp.dart';

class ResetPassword extends StatefulWidget {
  @override
  ResetPasswordPageState createState() => ResetPasswordPageState();
}

class ResetPasswordPageState extends State<ResetPassword> {
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;
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
                  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: <Widget>[
                // width: 440,
               
                Container(
                    margin: EdgeInsets.fromLTRB(20, 70, 20, 30),
                    height: 70,
                    // width: 200,
                    child: TextFormField(
                      style: TextStyle(color: Colors.blueAccent),
                      controller: _email,
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //     borderSide: new BorderSide(
                          //         color: Colors.red, width: 5.0)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 2.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
          color:Color(int.parse("0xff53B2E8")),
                               
                                width: 2.0),
                          ),
                          labelStyle: TextStyle(
                                      color:Color(int.parse("0xff53B2E8")),

                          ),
                          labelText: "New Password"),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Requried *"),
                      ]),
                    )),

  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
                    height: 70,
                    // width: 200,
                    child: TextFormField(
                      style: TextStyle(color: Colors.blueAccent),
                      controller: _email,
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //     borderSide: new BorderSide(
                          //         color: Colors.red, width: 5.0)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 2.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
          color:Color(int.parse("0xff53B2E8")),
                               
                                width: 2.0),
                          ),
                          labelStyle: TextStyle(
                                      color:Color(int.parse("0xff53B2E8")),

                          ),
                          labelText: "Confrim Password"),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Requried *"),
                      ]),
                    )),

                InkWell(
       


          child: 
Container(
   margin: EdgeInsets.fromLTRB(00, 70, 00, 00),
  alignment: Alignment.center,
      child:              new Text(
                          'Reset',
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
                    // _login();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                ),

              ] // mainAxisAlignment: MainAxisAlignment.center,
                      )),
            ),
          ),
        ));
  }
}
