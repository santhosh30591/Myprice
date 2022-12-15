import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myprice/router/router.dart';
import 'package:myprice/utils/local_data.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    String islocal = "";
    try {
      islocal = await LocalDatas().getLoginLocalData() as String;
    } catch (e) {}
    print(" local data $islocal islocal size " + islocal.length.toString());
    Timer(const Duration(seconds: 3), () {
      if (islocal == "") {
        Navigator.pushReplacementNamed(context, login);
      } else {
        Navigator.pushReplacementNamed(context, homePage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Color(0xfff4f4f4),
            alignment: Alignment.center,
            child: Center(
                child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "₹",
                  style: TextStyle(fontSize: 90, color: Colors.amber),
                ),
                Text(
                  "My Price",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: Container(
                  // width: 100,
                  // decoration: const BoxDecoration(shape: BoxShape.circle),

                  child: Image.asset('assets/ic_splash.png'),
                )),
              ],
            ))));
    // child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}
