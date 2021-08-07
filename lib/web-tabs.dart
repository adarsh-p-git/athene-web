import 'package:aagneya_flutter_app/utilities/Url.dart';
import 'package:aagneya_flutter_app/utilities/constants.dart';
import 'package:aagneya_flutter_app/winner-card-web.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:html' show window;

String url_=URL+'/app-event-register/';

class Tabsweb extends StatefulWidget {

  @override
  _TabsStateweb createState() => _TabsStateweb();
}

class _TabsStateweb extends State<Tabsweb> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
                    height: 500.0,
                    child: Card(
                      color: Colors.grey[300],
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          Expanded(
                            child: Container(
                              
                              height: 50.0,
                              width: double.infinity,
                              //color: Colors.yellow,
                              child: Row(children: <Widget>[
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(VIDEO_LIST_SCREEN);
                                      },
                                      child: Container(
                                          height: 300.0,
                                          child: Card(
                                              color: Colors.grey[200],
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          32)),
                                              child: Center(
                                                  child: Text(
                                                "Watch events",
                                                style: TextStyle(
                                                  color: Color(0xFFFF9800),
                                                  fontFamily: 'OpenSans',
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ))))),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(SCORE);
                                      },
                                      child: Container(
                                          height: 300.0,
                                          child: Card(
                                              color: Colors.grey[200],
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          32)),
                                              child: Center(
                                                  child: Text(
                                                "Score",
                                                style: TextStyle(
                                                  color: Color(0xFFFF9800),
                                                  fontFamily: 'OpenSans',
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ))))),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Expanded(
                            child: Container(
                              height: 50.0,
                              width: double.infinity,
                              //color: Colors.yellow,
                              child: Row(children: <Widget>[
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(GALLERY);
                                      },
                                      child: Container(
                                          height: 300.0,
                                          child: Card(
                                              color: Colors.grey[200],
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          32)),
                                              child: Center(
                                                  child: Text(
                                                "Gallery",
                                                style: TextStyle(
                                                  color: Color(0xFFFF9800),
                                                  fontFamily: 'OpenSans',
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ))))),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        window.localStorage.containsKey("userid")? html.window.open(url_+window.localStorage["userid"],"_self"):Navigator.of(context).pushNamed(SIGN_IN);
                                        
                                      },
                                      child: Container(
                                          height: 300.0,
                                          child: Card(
                                              color: Colors.grey[200],
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          32)),
                                              child: Center(
                                                  child: Text(
                                                "Register",
                                                style: TextStyle(
                                                  color: Color(0xFFFF9800),
                                                  fontFamily: 'OpenSans',
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ))))),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                              ]),
                            ),
                          ),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(EVENT_SCREEN);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Container(
                                        height: 300.0,
                                        width: double.infinity,
                                        child: Card(
                                            //color: Colors.yellow,
                                            color: Colors.grey[200],
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32)),
                                            child: Center(
                                                child: Text(
                                              "Upcoming events",
                                              style: TextStyle(
                                                color: Color(0xFFFF9800),
                                                fontFamily: 'OpenSans',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )))),
                                  ))),
                        ],
                      ),
                    ))),
            Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Card(
                        color: Colors.grey[300],
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        child: Container(
                          height: 500.0,
                          child: Column(
                            children: <Widget>[
                              WinnerScreenWeb(),
                            ],
                          ),
                        )))),
          ],
        ));
  }
}
