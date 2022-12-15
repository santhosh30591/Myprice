import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myprice/model/daily_task_model.dart';
import 'package:myprice/model/farmermodel.dart';
import 'package:myprice/model/getTestdata.dart';
import 'package:http/http.dart' as http;
import 'package:myprice/model/home_Item_model.dart';
import 'package:myprice/model/notification_list.dart';
import 'package:myprice/network/api.dart';
import 'package:myprice/router/router.dart';
import 'package:myprice/utils/local_data.dart';

Future<PostModel> getSinglePostData(context) async {
  PostModel result = new PostModel();
  try {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/2"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      print("data is 3 " + item.toString());
      result = PostModel.fromJson(item);
    } else {
      showToastMsg("Data not found responce is ${response.statusCode}");
    }
  } catch (e) {
    showToastMsg("Url Error No responces");
  }
  return result;
}

Future<FarmerLoginModel> postFormarLogin(context, username, password) async {
  FarmerLoginModel result = FarmerLoginModel();
  try {
    Map<String, dynamic> user = {
      'phoneNumber': username,
      'password': password,
    };

    final response = await http.post(Uri.parse(urlLogin),
        headers: {"Content-Type": "application/json"}, body: json.encode(user));
    if (response.statusCode == 200) {
      print(response.body);

      // Navigator.pushReplacementNamed(context, homePage);
      await LocalDatas().loginSaveLocalData(response.body);
      var local = await LocalDatas().getLoginLocalData() as String;
      final item = json.decode(local);
      result = FarmerLoginModel.fromJson(item);
    } else {
      String msg = "";
      try {
        final item = json.decode(response.body);
        msg = item["message"].toString();
      } catch (e) {
        msg = "Data not found responce is ${response.statusCode}";
      }
      showToastMsg(msg);
    }
  } catch (e) {
    print("url error " + e.toString());
    showToastMsg("Url Error No responces");
  }
  return result;
}

Future<HomePageItemModel> postHomePage(context, item, token) async {
  HomePageItemModel result = HomePageItemModel();
  try {
    Map<String, dynamic> user = {'item': item};

    final uri = await Uri.https(MainBase, '/api/v1/count-app', user);

    token = Uri.encodeComponent(token);
    Map<String, String> header = {
      "Authorization": token,
    };

    final response = await http.get(
      uri,
      headers: header,
    );

    print("home page url error $token " +
        response.body +
        " code " +
        response.statusCode.toString());

    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      result = HomePageItemModel.fromJson(res);
    } else {
      String msg = "";
      try {
        final item = json.decode(response.body);
        msg = item["message"].toString();
      } catch (e) {
        msg = "Data not found responce is ${response.statusCode}";
      }

      print("home page url error $token " + response.body);
      showToastMsg(msg);
    }
  } catch (e) {
    result = HomePageItemModel();
    print("url error " + e.toString());
    showToastMsg("Url Error No responces");
  }
  return result;
}

Future<NotificationListModel> postApiNotification(context, token) async {
  NotificationListModel result = NotificationListModel();
  result.data = [];
  try {
    final uri = Uri.https(MainBase, '/api/v1/notification');
    Map<String, String> header = {
      "Authorization": token,
    };

    final response = await http.get(
      uri,
      headers: header,
    );

    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      result = NotificationListModel.fromJson(res);
    } else {
      String msg = "";
      try {
        final item = json.decode(response.body);
        msg = item["message"].toString();
      } catch (e) {
        msg = "Data not found responce is ${response.statusCode}";
      }

      print("home page url error $token " + response.body);
      showToastMsg(msg);
    }
  } catch (e) {
    result = NotificationListModel();
    print("url error " + e.toString());
    showToastMsg("Url Error No responces");
  }

  return result;
}

Future<DailyTaskModel> postDailyTask(context, token, id, type) async {
  DailyTaskModel result = DailyTaskModel();

  Map<String, dynamic> user = {'userType': type};
  try {
    final uri = Uri.https(MainBase, '/api/v1/farmer/$id', user);
    Map<String, String> header = {
      "Authorization": token,
    };

    // print("daily url  $token " + uri.toString());
    final response = await http.get(
      uri,
      headers: header,
    );

    // print("daily task $token " + response.body);

    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      result = DailyTaskModel.fromJson(res);
    } else {
      String msg = "";
      try {
        final item = json.decode(response.body);
        msg = item["message"].toString();
      } catch (e) {
        msg = "Data not found responce is ${response.statusCode}";
      }

      print("home page url error $token " + response.body);
      showToastMsg(msg);
    }
  } catch (e) {
    result = DailyTaskModel();
    print("url error " + e.toString());
    showToastMsg("Url Error No responces");
  }

  return result;
}

showToastMsg(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.black,
      fontSize: 16.0);
}
