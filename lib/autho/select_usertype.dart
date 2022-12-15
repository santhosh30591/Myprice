import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myprice/autho/login.dart';
import 'package:myprice/router/router.dart';
import 'package:myprice/utils/theams.dart';

class SelectUserType extends StatefulWidget {
  @override
  _SelectUserTypeState createState() => _SelectUserTypeState();
}

class _SelectUserTypeState extends State<SelectUserType> {
  var isFormer = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(15),
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Text(
                    "Select user type",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 25,
              ),
              InkWell(
                child: Container(
                    padding: EdgeInsets.all(25),
                    margin: EdgeInsets.all(3),
                    decoration: isFormer == true
                        ? BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                100), //border corner radius
                            boxShadow: [
                              BoxShadow(
                                color: app_primary,
                                spreadRadius: 1.5, //spread radius
                              ),
                              //you can set more BoxShadow() here
                            ],
                          )
                        : BoxDecoration(
                            color: Color(0xfff2f0f0),
                            borderRadius: BorderRadius.circular(
                                100), //border corner radius
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: 1.5, //spread radius
                              ),
                              //you can set more BoxShadow() here
                            ],
                          ),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Color(0xffe1e3e1), shape: BoxShape.circle),
                      margin: EdgeInsets.all(15),
                      child: Icon(
                        Icons.person,
                        size: 70,
                        color: isFormer == true ? app_primary : Colors.white,
                      ),
                    )),
                onTap: () {
                  setState(() {
                    isFormer = true;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "I am a Formar",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight:
                        isFormer == true ? FontWeight.bold : FontWeight.normal),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                    padding: EdgeInsets.all(25),
                    margin: EdgeInsets.all(3),
                    decoration: isFormer != true
                        ? BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                100), //border corner radius
                            boxShadow: [
                              BoxShadow(
                                color: app_primary,
                                spreadRadius: 1.5, //spread radius
                              ),
                              //you can set more BoxShadow() here
                            ],
                          )
                        : BoxDecoration(
                            color: Color(0xfff2f0f0),
                            borderRadius: BorderRadius.circular(
                                100), //border corner radius
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: 1.5, //spread radius
                              ),
                              //you can set more BoxShadow() here
                            ],
                          ),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Color(0xffe1e3e1), shape: BoxShape.circle),
                      margin: EdgeInsets.all(15),
                      child: Icon(
                        Icons.person,
                        size: 70,
                        color: isFormer != true ? app_primary : Colors.white,
                      ),
                    )),
                onTap: () {
                  setState(() {
                    isFormer = false;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "I am a Vendor",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight:
                        isFormer != true ? FontWeight.bold : FontWeight.normal),
              )
            ],
          ))),
      bottomNavigationBar: Container(
          child: InkWell(
        child: Container(
          height: 40,
          margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
          decoration: BoxDecoration(
            color: app_primary,
            borderRadius: BorderRadius.circular(15), //border corner radius
            boxShadow: [
              BoxShadow(
                //color of shadow
                color: Colors.amber,
                spreadRadius: 1, //spread radius
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            "Continue",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        onTap: () {
          Navigator.pushReplacementNamed(context, login);
        },
      )),
    );
    // child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}
