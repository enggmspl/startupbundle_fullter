import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:startup_bundle_flutter/Screens/Auth/Login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class SignUp extends StatefulWidget {
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUp> {
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  String typeStatus = 'parent';

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





 void _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _progress = false;
    });
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email.text);
    print(emailValid);
    if (_email.text == '' || _password.text == ''||_name.text=='') {
      return showAlertDialog(context, 'All Fields Requried');
    }
    if (emailValid == false) {
      return showAlertDialog(context, 'Email Not Valid');
    } else {
      DialogBuilder(context).showLoadingIndicator("");

      Map data = {
        "firstName": _name.text,

        "email": _email.text,
        "password": _password.text,
        "type":"flutter",
        "role":"parent"
      };
      print(data);
      var response = await http.post(
          Uri.parse(
            "https://wondrfly.com/api/users/register",
          ),
          body: data);
      var loginData = json.decode(response.body);
      print(loginData);
      if (loginData['statusCode'] == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        DialogBuilder(context).hideOpenDialog();
        print(loginData);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Login()));
      } else {
        DialogBuilder(context).hideOpenDialog();
        // If the server did not return a 200 OK response,
        // then throw an exception.
        print(loginData['error']);
        return showAlertDialog(context, loginData['error']);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
      
        body: Padding(
          padding: EdgeInsets.all(0),
          child: Center(
            child: Form(
              autovalidate: true,
              key: formkey,
              child: SizedBox.expand(
                  child: SingleChildScrollView(
                      // -> 01
                      child: Column(children: <Widget>[


 Padding(
                    padding: EdgeInsets.only( top: 60),
                    child: Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       InkWell(
                          onTap: () {
                        ChangeStatus('parent');
                          },
                          child:  
                     Container(

      child:       Column(
  mainAxisAlignment: MainAxisAlignment.center,

        children: [
           Icon(
      Icons.people_outline_rounded ,

     
     color: typeStatus=='parent'? Color(int.parse("0xff53B2E8")):Colors.grey,
      size: 30.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ),
                Text('I’m a Parent',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 14,
                                      color: typeStatus=='parent'? Color(int.parse("0xff53B2E8")):Colors.grey,

                                  fontWeight: FontWeight.bold)),
        ],
      ),

      decoration: BoxDecoration(
        border: Border.all(
                          color: typeStatus=='parent'? Color(int.parse("0xff53B2E8")):Colors.grey,

                      width: 1.0,
                      style: BorderStyle.solid), //Border.all
                  /*** The BorderRadius widget  is here ***/
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ), //BorderRadi
          ),
      height: 80,
      width: 120,
     ),
                       ),
                                   InkWell(
                          onTap: () {
                        ChangeStatus('provider');
                          },
                          child:        Container(

      child:       Column(
  mainAxisAlignment: MainAxisAlignment.center,

        children: [
           Icon(
      Icons.business_rounded ,
     color: typeStatus=='provider'? Color(int.parse("0xff53B2E8")):Colors.grey,
      size: 30.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ),
                Text('I’m a Provider',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: typeStatus=='provider'? Color(int.parse("0xff53B2E8")):Colors.grey,
                                  fontWeight: FontWeight.bold)),
        ],
      ),

      decoration: BoxDecoration(
        border: Border.all(
                         color: typeStatus=='provider'? Color(int.parse("0xff53B2E8")):Colors.grey,

                      width: 1.0,
                      style: BorderStyle.solid), //Border.all
                  /*** The BorderRadius widget  is here ***/
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ), //BorderRadi
          ),
      height: 80,
      width: 120,
     ),
                        ),
                      ],
                    )),






                

                Container(
                    margin: EdgeInsets.fromLTRB(20, 50, 20, 30),
                    height: 70,
                    // width: 200,
                    child: TextFormField(
                      style: TextStyle(color: Colors.blueAccent),
                      controller: _name,
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
                                color: Colors.blueAccent, width: 2.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.blueAccent,
                          ),
                          labelText: "Name"),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Requried *"),
                      ]),
                    )),
                // width: 440,
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
                                color: Colors.blueAccent, width: 2.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.blueAccent,
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
                        style: TextStyle(color: Colors.blueAccent),
                        controller: _password,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 2.0),
                          ),
                          // hintText: 'username@mail.com',
                          labelText: 'Password',
                          // hintStyle: TextStyle(color: Colors.white),
                          labelStyle:
                              TextStyle(color: Colors.blueAccent, fontSize: 20),
                        ),
                        obscureText: _obscureText,
                        validator: validatePass)),

               InkWell(
       


          child: 
Container(
   margin: EdgeInsets.fromLTRB(00, 40, 00, 00),
  alignment: Alignment.center,
      child:              new Text(
                          'Sign up',
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
                    //     MaterialPageRoute(builder: (context) => Login()));
                  },
                ),
              
              ] // mainAxisAlignment: MainAxisAlignment.center,
                          ))),
            ),
          ),
        ));
  }
}




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