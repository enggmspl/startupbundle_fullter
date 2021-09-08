// import 'package:flutter/material.dart';
// import 'package:meander_training/HomeListing.dart';

// class Home extends StatefulWidget {
//   @override
//   HomePageState createState() => HomePageState();
// }

// class HomePageState extends State<Home> {
//   // final scaffoldKey = GlobalKey<ScaffoldState>();
//   int _currentIndex = 0;
//   final List<Widget> _children = [
//     HomeListing(),
//     HomeListing(),
//     HomeListing(),
//     HomeListing()
//   ];
//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Meander Training",
//         ),
//       ),
//       body: _children[_currentIndex],
//       // bottomNavigationBar: BottomNavigationBar(
//       //   onTap: onTabTapped, // new
//       //   currentIndex: _currentIndex, // new
//       //   items: [
//       //     new BottomNavigationBarItem(
//       //       icon: Icon(Icons.home),
//       //       title: Text('Home'),
//       //     ),
//       //     new BottomNavigationBarItem(
//       //       icon: Icon(Icons.library_books),
//       //       title: Text('My Course'),
//       //     ),
//       //     new BottomNavigationBarItem(
//       //         icon: Icon(Icons.person), title: Text('Profile')),
//       //     new BottomNavigationBarItem(
//       //       icon: Icon(Icons.library_books),
//       //       title: Text('WishList'),
//       //     ),
//       //   ],
//       // ),
//       bottomNavigationBar: new TabBar(
//         tabs: [
//           Tab(
//             icon: new Icon(Icons.home),
//           ),
//           Tab(
//             icon: new Icon(Icons.rss_feed),
//           ),
//           Tab(
//             icon: new Icon(Icons.perm_identity),
//           ),
//           Tab(
//             icon: new Icon(Icons.settings),
//           )
//         ],
//         labelColor: Colors.yellow,
//         unselectedLabelColor: Colors.blue,
//         indicatorSize: TabBarIndicatorSize.label,
//         indicatorPadding: EdgeInsets.all(5.0),
//         indicatorColor: Colors.red,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:startup_bundle_flutter/Screens/Auth/Login.dart';
import 'package:startup_bundle_flutter/Screens/Auth/SignUp.dart';
import 'package:startup_bundle_flutter/Screens/HomeScreens/FaqHome.dart';
import 'package:startup_bundle_flutter/Screens/HomeScreens/PrivacyPolicy.dart';
import 'package:startup_bundle_flutter/Screens/HomeScreens/TermCondition.dart';
import 'package:startup_bundle_flutter/Screens/HomeScreens/NotificationHome.dart';
import 'package:startup_bundle_flutter/Screens/HomeScreens/UserSetting.dart';
class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      // appBar: AppBar(
      //   leading: IconButton(          icon: Icon(Icons.arrow_back, color: Colors.red),
      //     onPressed: () => Navigator.of(context).pushReplacement(
      //          MaterialPageRoute(builder: (BuildContext context) => Login())),
      //    ),
      //    title: Text(
      //      "SignUp",
      //   ),
      // );
        
    
   return  new MaterialApp(
      color: Colors.yellow,
      home: DefaultTabController(
        length: 2,
        child: new Scaffold(
            key: _scaffoldKey,
           appBar: AppBar(
              leading:     IconButton(    icon: Icon(Icons.menu),   color:Color(int.parse("0xff53B2E8")),      
         iconSize: 30,  onPressed: () => _scaffoldKey.currentState.openDrawer(),       ),
       
        backgroundColor:Colors.white,
        title: Text(
          "Logo",
            style: TextStyle(
                                  fontSize: 20,
                                color:Color(int.parse("0xff53B2E8")),
                                 )
        ),
          
      ),
          body: TabBarView(
            children: [
              
              NotificationHome(),
              UserSetting(),
            ],
                     
          ),
drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              // child: Image.network('https://media4.giphy.com/media/h6x0ROdzJy4TKyUu1b/giphy-downsized-large.gif',  width: 400,
              //                           height: 200,
              //                           fit:BoxFit.fitWidth  ),
              // decoration: BoxDecoration(
              //   color: Colors.white,
              // ),
                child: Text(''),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image:   NetworkImage("https://media4.giphy.com/media/h6x0ROdzJy4TKyUu1b/giphy-downsized-large.gif"),
                     fit: BoxFit.cover)
              ),
            ),
              GestureDetector(
                onTap: () {
                
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TermCondition()));
                },
                child: Padding(
                    padding: EdgeInsets.only( top: 40,left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      
                        Text('Terms and Conditions ',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 17,
                               color:Color(int.parse("0xff53B2E8"))
                                 )),

                       Icon(Icons.assignment_outlined , size: 30.0,color:Color(int.parse("0xff53B2E8"))),
                      ],
                    )),
              ),

              
              GestureDetector(
                onTap: () {
                
                  Navigator.of(context).pop();
                },
                child: Padding(
                    padding: EdgeInsets.only( top: 40,left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      
                        Text('Contact Us',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 17,
                                  color:Color(int.parse("0xff53B2E8"))
                                 )),

                       Icon(Icons.contact_phone_outlined, size: 30.0,color:Color(int.parse("0xff53B2E8"))),
                      ],
                    )),
              ),
                 GestureDetector(
                onTap: () {
                
                  Navigator.of(context).pop();
                   Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PrivacyPolicy()));
                },
                child: Padding(
                    padding: EdgeInsets.only( top: 40,left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      
                        Text('Privacy Policy ',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 17,
                                color:Color(int.parse("0xff53B2E8"))
                                 )),

                       Icon(Icons.verified_user_sharp, size: 30.0,color:Color(int.parse("0xff53B2E8"))),
                      ],
                    )),
              ),

                GestureDetector(
                onTap: () {
                
                  Navigator.of(context).pop();
                  
                },
                child: Padding(
                    padding: EdgeInsets.only( top: 40,left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      
                        Text('Logout ',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 17,
                                 color:Color(int.parse("0xff53B2E8"))
                                 )),

                       Icon(Icons.input_rounded , size: 30.0,color:Color(int.parse("0xff53B2E8"))),
                      ],
                    )),
              ),
          ],
        ),
      ),
          bottomNavigationBar: new TabBar(
            tabs: [
             
             
              Tab(
                icon: new Icon(Icons.notifications_none_sharp, size: 30.0),
              ),
              Tab(
                icon: new Icon(Icons.person_outline_rounded , size: 30.0),
              )
            ],
            labelColor: Colors.blueAccent,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(15.0),
            indicatorColor: Colors.blueAccent,
          ),
          backgroundColor: Colors.white,
  
        ),
      ),
    );
  }
}
















// import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'SignIn.dart';
// import 'SignUp.dart';

// class Home extends StatefulWidget {
//   @override
//   HomePageState createState() => HomePageState();
// }

// class HomePageState extends State<Home> {
//   // final scaffoldKey = GlobalKey<ScaffoldState>();
//   int _currentIndex = 0;
//   final List<Widget> _children = [
//     SignIn(),
//     SignUp(),
//     SignIn(),
//   ];
//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Home",
//         ),
//       ),
//       body: _children[_currentIndex],
     
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: onTabTapped, // new
//         currentIndex: _currentIndex, // new
//         items: [
//           new BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text('Home'),
//           ),
//           new BottomNavigationBarItem(
//             icon: Icon(Icons.mail),
//             title: Text('Messages'),
//           ),
//           new BottomNavigationBarItem(
//               icon: Icon(Icons.person), title: Text('Profile'))
//         ],
//       ),
//     );
//   }
// }









