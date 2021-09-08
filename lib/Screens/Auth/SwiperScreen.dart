import 'dart:async';
import 'package:flutter/material.dart';
import 'package:startup_bundle_flutter/Screens/Auth/Login.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class SwiperScreen extends StatefulWidget {
  @override
  SwiperScreenState createState() => SwiperScreenState();
}

class SwiperScreenState extends State<SwiperScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Swiper(
        itemBuilder: (BuildContext context,int index){
          return Container(child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
Image.asset("assets/business.png",
                  width: 150, height: 150, fit: BoxFit.fill),
                  Container(
          margin: EdgeInsets.fromLTRB(00, 20, 00, 00),

                  child:
                  Text('Startup',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold))),
                                     Container(
  alignment: Alignment.center,
                                  width: 300,     
          margin: EdgeInsets.fromLTRB(30, 20, 00, 00),

                  child:
                  Text('The act or an instance of giving notice or information Notification of all winners will occur tomorrow.',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold))),


                           InkWell(
       


          child: 
Container(
   margin: EdgeInsets.fromLTRB(00, 100, 00, 00),
  alignment: Alignment.center,
      child:              new Text(
                          'Get Started',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          color:Color(int.parse("0xff53B2E8")),
        
          ),
      height: 50,
      width: 200,
     ),
                  onTap: () {
                    // _login();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                ),
          ]));

          
        },
        itemCount: 3,
        pagination: new SwiperPagination(),
        control: new SwiperControl(iconPrevious:null,iconNext: null),
      ),
    );
  }
}