import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:getwidget/getwidget.dart';
class NotificationHome extends StatefulWidget {
  @override
  NotificationHomePageState createState() => NotificationHomePageState();
}



class NotificationHomePageState extends State<NotificationHome> {
  // final scaffoldKey = GlobalKey<ScaffoldState>();
    final itemsList = List<String>.generate(10, (n) => "List item ${n}");
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

 Widget slideRightBackground() {
  return Container(
    color: Colors.white,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
          Text(
            " Edit",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    ),
  );
}
Widget slideLeftBackground() {
  return Container(
    color: Colors.red,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Text(
            " Delete",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      alignment: Alignment.centerRight,
    ),
  );
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
                child: Text('Notification (4)',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          )),


            Container(
          margin: EdgeInsets.fromLTRB(20, 30, 20, 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
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
          child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
            
            children: [

   Padding(
                    padding: EdgeInsets.only( top: 20,left:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      
                        Text('Alert ',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                                 )),
                                   InkWell(
                          onTap: () {
                         
                          },
                          child: Text('  2 New',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.redAccent,
                                 )),
                        ),
                    
    
                      ],
                    )),
 ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:9,
                // itemBuilder: (context,index){
                //   return  
              
                // }
          itemBuilder: (context, index) {
return Dismissible(
  key: Key(itemsList[index]),
  background: slideRightBackground(),
secondaryBackground: slideLeftBackground(),
confirmDismiss: (direction) async {
  if (direction == DismissDirection.endToStart) {
    final bool res = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
                "Are you sure you want to delete ${itemsList[index]}?"),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  // TODO: Delete the item from DB etc..
                  setState(() {
                    itemsList.removeAt(index);
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
    return res;
  } else {
    // TODO: Navigate to edit page;
  }
},
  child: InkWell(
      onTap: () {
        print("${itemsList[index]} clicked");
      },
      child:Container(
                    alignment: Alignment.topLeft,
                    child: Column(children: [

                  Padding(
                    padding: EdgeInsets.only( top: 20,left:20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                     Align(
            alignment: Alignment.centerLeft,
            child: Text('Today 11:50 am ',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                                 )),
          ),
                       
                                   InkWell(
                          onTap: () {
                         
                          },
                          child: Text(' Bulleted and numbered lists can be used in your documents to outline, arrange, and emphasize text.',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                 )),
                        ),
                    
    
                      ],
                    )),
                  ],),)),
);
}
                )
          ],)
          
          ),

            ]
                )));
  }
}

// 2831140187109832
