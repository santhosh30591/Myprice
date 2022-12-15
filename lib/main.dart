import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myprice/providers/dataProvider.dart';
import 'package:myprice/router/router.dart' as route;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider()),
];

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: RouterConfig(),
    ),
  );
}
// void main() => runApp(SplashScreen());

class RouterConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.controller,
      // initialRoute: route.splash,
      initialRoute: route.intro,
    );
  }
}
