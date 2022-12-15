import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myprice/model/farmermodel.dart';
import 'package:myprice/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatas {
  String db_login = "login";
  String db_lan = "login";

  late BuildContext _context;
  late SharedPreferences preferences;

  loginSaveLocalData(String data) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString(db_login, data);
  }

  dbLanguageSet(String inputs) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString(db_lan, inputs);
  }

  Future<String> getLoginLocalData() async {
    preferences = await SharedPreferences.getInstance();
    String datas = "";
    try {
      datas = preferences.getString(db_login) as String;
    } catch (e) {}

    if (datas.isEmpty || datas.length == 4 || datas == "null") {
      return "";
    } else {
      return datas.toString();
    }
  }

  Future<String> dbLanguageGet() async {
    preferences = await SharedPreferences.getInstance();
    String datas = "";
    try {
      datas = preferences.getString(db_lan) as String;
    } catch (e) {
      datas = "";
    }

    if (datas.isEmpty || datas.length == 4 || datas == "null") {
      return "";
    } else {
      return datas.toString();
    }
  }

  Future<FarmerLoginModel> getLoginLocalDatas() async {
    preferences = await SharedPreferences.getInstance();
    FarmerLoginModel login = FarmerLoginModel();
    try {
      var datas = preferences.getString(db_login) as String;
      final item = json.decode(datas);
      login = FarmerLoginModel.fromJson(item);
    } catch (e) {}
    return login;
  }

  dbLogout() async {
    preferences = await SharedPreferences.getInstance();
    preferences.remove(db_login);
    preferences.clear();
  }
}
