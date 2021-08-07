import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:aagneya_flutter_app/utilities/Url.dart';


class WinnerScreenWeb extends StatefulWidget {
  @override
  _WinnerScreenStateWeb createState() => _WinnerScreenStateWeb();
}

class _WinnerScreenStateWeb extends State<WinnerScreenWeb> {
  Future<List<Winner>> getWinners() async {
    Dio dio = new Dio();
    List<Winner> winners = [];

    String _name;
    String department;
    String semester;
    String winnerid;
    String assetN;
    String description;
    var usr;
    var user1;
    var res;
    res = await dio.get(URL + "/app-get-winner");
    var i = 0;
    do {
      print(res.data[i]);
      usr = res.data[i];
      print(usr['name']);

      _name = usr["name"];
      department = usr["department"];
      semester = usr["semester"];

      winnerid = usr["_id"];
      assetN = URL + "/winner-images/" + winnerid + ".jpg";
      description = usr["description"];
      Winner winnerObj = Winner(
          i.toString(), _name, department, semester, assetN, description);

      winners.add(winnerObj);

      i = i + 1;
      if (res.data.length == i) {
        user1 = winners;
        break;
      }
    } while (res.data[i] != null);

    print(user1);
    return user1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: FutureBuilder(
          future: getWinners(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Center(
                  heightFactor: 1.5,
                  child: Card(
                    shadowColor: Colors.grey,
                    child: Center(
                        child: Image.asset(
                      'assets/photoloading.gif',
                      height: 320,
                    )),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ));
            } else {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),

                height: 500,

                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                          color: Colors.grey[50],
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            padding: EdgeInsets.all(10.0),
                            height: 140.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              //color: Colors.white,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.black12,
                              //     offset: Offset(0, 1),
                              //     blurRadius: 6.0,
                              //   ),
                              // ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Image(
                                  width: 150.0,
                                  image: NetworkImage(
                                      snapshot.data[index].imgPath),
                                  errorBuilder: (context, url, error) {
                                    return Container(
                                      child: Image.asset(
                                        'assets/default_person.jpg',
                                        fit: BoxFit.fitWidth,
                                        alignment: Alignment.topCenter,
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(width: 10.0),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      width: 300.0,
                                      child: Text(
                                        snapshot.data[index].name,
                                        style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      width: 300.0,
                                      child: Text(
                                        snapshot.data[index].department +
                                            "  " +
                                            snapshot.data[index].semester,
                                        style: TextStyle(
                                          color: Colors.grey[900],
                                          fontFamily: 'OpenSans',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      height: 60.0,
                                      width: 400.0,
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 20),
                                      child: new Text(
                                        snapshot.data[index].description,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        style: TextStyle(
                                          color: Colors.grey[900],
                                          fontFamily: 'OpenSans',
                                          fontSize: 9.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ));
                    }),
              );
            }
          },
        ),
      ),
    );
  }
}

class Winner {
  //final int id;
  final String id;
  final String name;
  final String department;
  final String semester;
  final String imgPath;
  final String description;

  Winner(this.id, this.name, this.department, this.semester, this.imgPath,
      this.description);
}
