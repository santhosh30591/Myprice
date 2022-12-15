import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:myprice/utils/local_data.dart';
import 'package:myprice/utils/theams.dart';

import 'package:myprice/router/router.dart' as route;

class IntroSliderDemo extends StatefulWidget {
  const IntroSliderDemo({Key? key}) : super(key: key);

  @override
  _IntroSliderDemoState createState() => _IntroSliderDemoState();
}

class _IntroSliderDemoState extends State<IntroSliderDemo> {
  List<Slide> slides = [];

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      colorActiveDot: app_primary,
      onDonePress: onDonePress,
      onNextPress: onNextPress,
    );
  }

  checkLogin() async {
    String islocal = "";
    try {
      islocal = await LocalDatas().getLoginLocalData() as String;
    } catch (e) {}
    print(" local data $islocal islocal size " + islocal.length.toString());

    if (islocal == "") {
      // Navigator.pushReplacementNamed(context, route.terms);
    } else {
      Navigator.pushReplacementNamed(context, route.splash);
    }
  }

  @override
  void initState() {
    super.initState();
    slides.add(
      Slide(
        title: "Welcome To MyPrice",
        styleTitle: TextStyle(color: app_primary, fontSize: 20),
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        description: 'Take part in Auctions'
            ' Get a chance to sell your crops faster by participating in auctions.',
        pathImage: "assets/intro/intro1.png",
        heightImage: 180,
        widthImage: 400,
        backgroundColor: const Color(0xffffffff),
      ),
    );
    slides.add(
      Slide(
        title: "Welcome To MyPrice",
        styleTitle: TextStyle(color: app_primary, fontSize: 20),
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        description: "Curate your crops "
            "Select the crops you grow and have them as a part of your collection ",
        pathImage: "assets/intro/intro2.png",
        heightImage: 180,
        widthImage: 400,
        backgroundColor: const Color(0xffffffff),
      ),
    );
    slides.add(
      Slide(
        title: "Welcome To MyPrice",
        styleTitle: TextStyle(color: app_primary, fontSize: 20),
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        description: "Record your transactions"
            "Transparent and detailed order data for all the transactions",
        pathImage: "assets/intro/intro3.png",
        heightImage: 180,
        widthImage: 400,
        backgroundColor: const Color(0xffffffff),
      ),
    );
    checkLogin();
  }

  void onDonePress() {
    Navigator.pushReplacementNamed(context, route.terms);
  }

  void onNextPress() {
    print("onNextPress caught");
    // Navigator.of(context).pop();
  }
}
