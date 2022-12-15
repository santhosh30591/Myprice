import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:myprice/model/daily_task_model.dart';
import 'package:myprice/model/farmermodel.dart';
import 'package:myprice/model/getTestdata.dart';
import 'package:myprice/model/home_Item_model.dart';
import 'package:myprice/model/notification_list.dart';
import 'package:myprice/network/demo.dart';
import 'package:http/http.dart' as http;
import 'package:myprice/network/services.dart';
import 'package:myprice/router/router.dart';
import 'package:myprice/utils/Utils.dart';
import 'package:myprice/utils/local_data.dart';

class DataProvider with ChangeNotifier {
  // PostModel post = PostModel();
  FarmerLoginModel former = FarmerLoginModel();
  HomePageItemModel homePageCount = HomePageItemModel();
  NotificationListModel notificationListModel = NotificationListModel();

  DailyTaskModel dailyTaskModel = DailyTaskModel();
  late Utils utils;

  bool loading = false;
  LoginPost(context, u, p) async {
    utils = Utils(context);
    loading = true;
    utils.startLoading();
    former = await postFormarLogin(context, u, p);
    utils.stopLoading();
    loading = false;
    if (former.status.toString() == "200") {
      Navigator.pushReplacementNamed(context, homePage);
    }
    notifyListeners();
  }

  getHomeDetails() {
    return homePageCount;
  }

  homePageLoading(context) async {
    utils = Utils(context);
    FarmerLoginModel local = await LocalDatas().getLoginLocalDatas();
    utils.startLoading();
    var branchId = local.data!.bmLocation?.sId.toString();
    var token = local.data!.token.toString();
    homePageCount = await postHomePage(context, branchId, token);
    utils.stopLoading();
    notifyListeners();
  }

  notificationList(context) async {
    utils = Utils(context);
    FarmerLoginModel local = await LocalDatas().getLoginLocalDatas();
    utils.startLoading();
    var token = local.data!.token.toString();
    notificationListModel = await postApiNotification(context, token);
    utils.stopLoading();
    notifyListeners();
  }

  dailyTaskList(context) async {
    utils = Utils(context);
    FarmerLoginModel local = await LocalDatas().getLoginLocalDatas();
    utils.startLoading();
    var _id = local.data!.sId.toString();
    var type = "f";
    var token = local.data!.token.toString();
    dailyTaskModel = await postDailyTask(context, token, _id, type);
    utils.stopLoading();
    notifyListeners();
  }

  getDataProviderResponces(context) async {
    loading = true;
    // post = PostModel();

    var id = "7600000755";
    // final uri =
    //     Uri.https('uat-vendor.censanext.com', 'api/Po_Detail/full_detail/?$id');
    // notifyListeners();
    // // downloadResponse(
    //   client,
    //   uri,
    // );
    //
    updateFruit(id);
  }

  updateFruit(String id) async {
    Map<String, String> map = Map();

    map["user_id"] = "28309";

    final uri = Uri.https('uat-vendor.censanext.com', '/api/Po_Detail', map);
    print("sa - " + uri.toString());
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(uri, headers: {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });
    // body: jsonEncode(map));

    // final response = await http
    //     .post(Uri.parse(uri));
    if (response.statusCode == 200) {
      print("sandy " + response.body.toString());
    } else {
      print("sandy e" + response.body.toString());
      throw Exception('Failed to update album.');
    }
  }
}
