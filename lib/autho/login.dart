import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myprice/providers/dataProvider.dart';
import 'package:myprice/router/router.dart';
import 'package:myprice/utils/Utils.dart';
import 'package:myprice/utils/theams.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var isFormer = true;

  late Utils utils;
  @override
  void initState() {
    super.initState();
    utils = Utils(context);
  }

  var umobile = TextEditingController();
  var upassword = TextEditingController();

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Container(
                  margin: const EdgeInsets.only(top: 40, left: 20),
                  child: InkWell(
                    child: Text(
                      "Welcome,",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      umobile.text = "9340172104";
                      upassword.text = "2019";
                    },
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Sign in to continue,",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: double.maxFinite,
                  child: Container(
                    height: 160,
                    // width: 100,
                    // decoration: const BoxDecoration(shape: BoxShape.circle),
                    margin: const EdgeInsets.all(15),
                    child: Image.asset('assets/ic_login.png'),
                  )),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: umobile,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mobile Number',
                      hintText: 'Enter valid Mobile Number'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 15, top: 5),
                child: TextField(
                  controller: upassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your secure password'),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  child: FlatButton(
                    onPressed: () {
                      // funLogin();
                      //TODO FORGOT PASSWORD SCREEN GOES HERE
                    },
                    child: Text(
                      'Forgot Password',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  )),
              Container(
                  height: 42,
                  margin: const EdgeInsets.only(
                      top: 20, left: 30, right: 30, bottom: 10),
                  child: InkWell(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: app_primary,
                        borderRadius:
                            BorderRadius.circular(15), //border corner radius
                        boxShadow: const [
                          BoxShadow(
                            //color of shadow
                            color: Colors.amber,
                            spreadRadius: 1, //spread radius
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      funLogin();
                      // Navigator.pushReplacementNamed(context, homePage);
                    },
                  )),
            ],
          ))),
    );
    // child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }

  funLogin() async {
    // setState(() {
    //   isLoading = true;
    // });

    // utils.startLoading();
    // Timer(const Duration(seconds: 3), () {
    //   setState(() {
    //     isLoading = false;
    //   });

    //   utils.stopLoading();
    // });
    var provider = Provider.of<DataProvider>(context, listen: false);
    await provider.LoginPost(
        context, umobile.text.toString(), upassword.text.toString());
  }
}
