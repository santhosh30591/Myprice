import 'package:flutter/material.dart';
import 'package:myprice/model/farmermodel.dart';
import 'package:myprice/model/home_Item_model.dart';
import 'package:myprice/model/notification_list.dart';
import 'package:myprice/providers/dataProvider.dart';
import 'package:myprice/utils/local_data.dart';
import 'package:myprice/utils/theams.dart';
import 'package:provider/provider.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  var token = "";

  NotificationListModel notificationListModel = NotificationListModel();
  @override
  void initState() {
    super.initState();
    notificationListModel.message = "Please wait loading...";
    notificationListModel.data = [];
    loadingDetails();
  }

  loadingDetails() async {
    final postMdl = Provider.of<DataProvider>(context, listen: false);
    await postMdl.notificationList(context);

    setState(() {
      try {
        notificationListModel = postMdl.notificationListModel;
        counts = notificationListModel.data!.length.toString();
      } catch (e) {}
    });
  }

  var counts = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: app_col,
          title: Text("Notification "),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: notificationListModel.data!.length == 0
            ? Center(
                child: Text(
                  notificationListModel.message.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff000000)),
                ),
              )
            : apiLoading());
  }

  Color LoadingIcons(status) {
    if (status == "Auction") {
      return Color(0xffe5cc82);
    } else if (status == "Shortlisted") {
      return Color(0xffec8ccf);
    } else if (status == "Po") {
      return Color(0xff7caaed);
    } else {
      return Color(0xffd77070);
    }
  }

  Widget apiLoading() {
    return ListView.builder(
        itemCount: notificationListModel.data!.length,
        itemBuilder: (context, i) {
          return Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            width: double.maxFinite,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                  alignment: Alignment.topLeft,
                  width: double.maxFinite,
                  child: Row(children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color:
                              LoadingIcons(notificationListModel.data![i].type),
                          shape: BoxShape.circle),
                      margin: EdgeInsets.all(15),
                      child: Icon(
                        notificationListModel.data![i].type == "Po"
                            ? Icons.currency_rupee
                            : notificationListModel.data![i].type == "Auction"
                                ? Icons.alarm_on
                                : notificationListModel.data![i].type ==
                                        "Shortlisted"
                                    ? Icons.note
                                    : Icons.alarm_off,
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
                            notificationListModel.data![i].title.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xff000000)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 5, 10),
                          child: Text(
                            notificationListModel.data![i].message.toString(),
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
          );
        });
  }

  Widget _getNoitifications() {
    return SingleChildScrollView(
        child: Column(children: [
      Container(
          child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            alignment: Alignment.topLeft,
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
                        Icons.alarm,
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
                            "Hurry Up!!! Its Aution time",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xff000000)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 5, 10),
                          child: Text(
                            "On Time: MANJUNATHAN T aution for undefined started. Please enter to auction at the earliest!",
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
          Container(
            alignment: Alignment.topLeft,
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
                          color: Color(0xffed87d4), shape: BoxShape.circle),
                      margin: EdgeInsets.all(15),
                      child: Icon(
                        Icons.notes,
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
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
                          child: Text(
                            "Congraulations!",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xff000000)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 5, 10),
                          child: Text(
                            "Your bid for undefined is shortlistd, accept the bid and don'n miss the opportunity!",
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
          Container(
            alignment: Alignment.topLeft,
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
                          color: Color(0xff76a6ed), shape: BoxShape.circle),
                      margin: EdgeInsets.all(15),
                      child: Icon(
                        Icons.currency_rupee,
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
                          margin: const EdgeInsets.fromLTRB(10, 0, 5, 5),
                          child: const Text(
                            "A PO order has been raised",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xff000000)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 5, 5),
                          child: Text(
                            "Your bid has been accepted and now audit will start.",
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
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                          color: Color(0xff6ad97d), shape: BoxShape.circle),
                      margin: const EdgeInsets.all(15),
                      child: const Icon(
                        Icons.cloud_circle,
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
                          margin: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                          child: Text(
                            "Selling made easy",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xff000000)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                          child: Text(
                            "Your are 3 steps close to yourgoal! accept the bid and don'n miss the opportunity!",
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
}
