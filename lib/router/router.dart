import 'package:flutter/material.dart';
import 'package:myprice/autho/login.dart';
import 'package:myprice/autho/select_usertype.dart';
import 'package:myprice/home/dailyTask/daily_task.dart';
import 'package:myprice/intro/splash.dart';
import 'package:myprice/home/notification/notificationmsg.dart';
import 'package:myprice/home/notification/temps.dart';
import 'package:myprice/home_main.dart';
import 'package:myprice/intro/intoslide.dart';
import 'package:myprice/intro/terms.dart';

// Route Names
const String login = 'login';
const String splash = 'splash';
const String homePage = 'home';
const String terms = 'terms';
const String settingsPage = 'settings';
const String selectUser = 'usertype';
const String notifications = 'notification';
const String intro = 'intro';
const String tempPage = 'pages';
const String dailyTask = 'dailyTesk';

// Control our page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splash:
      return MaterialPageRoute(builder: (context) => Splash());
    case login:
      return MaterialPageRoute(builder: (context) => Login());
    case homePage:
      return MaterialPageRoute(builder: (context) => HomeMainBase());

    case terms:
      return MaterialPageRoute(builder: (context) => const TermsConditions());
    case selectUser:
      return MaterialPageRoute(builder: (context) => SelectUserType());
    case notifications:
      return MaterialPageRoute(
          builder: (context) => const NotificationWidget());
    case intro:
      return MaterialPageRoute(builder: (context) => const IntroSliderDemo());
    case dailyTask:
      return MaterialPageRoute(builder: (context) => const DailyWidget());

    case tempPage:
      return MaterialPageRoute(
          builder: (context) => Temps(title: settings.arguments.toString()));

    default:
      throw ('This route name does not exit');
  }
}
