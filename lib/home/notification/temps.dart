import 'package:flutter/material.dart';
import 'package:myprice/home_main.dart';
import 'package:myprice/utils/theams.dart';

class Temps extends StatefulWidget {
  String title;
  Temps({key, required this.title});

  @override
  State<Temps> createState() => _Temps();
}

class _Temps extends State<Temps> {
  Widget _getNoitifications() {
    return SingleChildScrollView(
        child: Column(children: [
      Container(
          alignment: Alignment.center,
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                width: double.maxFinite,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                      alignment: Alignment.topLeft,
                      width: double.infinity,
                      child: Row(children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Color(0xffe5cc82), shape: BoxShape.circle),
                          margin: EdgeInsets.all(15),
                          child: Icon(
                            Icons.notifications,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 5, 5),
                              child: Text(
                                "Process stages",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color(0xff000000)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 5, 10),
                              child: Text(
                                "Presently in the development stage coming soon",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        )),
                      ])),
                ),
              ),
            ],
          ))
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: app_col,
          title: Text(widget.title),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: _getNoitifications());
  }
}
