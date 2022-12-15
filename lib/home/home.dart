import 'package:flutter/material.dart';
import 'package:myprice/model/farmermodel.dart';
import 'package:myprice/model/home_Item_model.dart';
import 'package:myprice/providers/dataProvider.dart';
import 'package:myprice/router/router.dart';
import 'package:myprice/utils/local_data.dart';
import 'package:myprice/utils/theams.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  var itemCount = "no";
  var liveAuctionCount = "no";
  var shortlistBidCount = "no";
  var poCount = "no";
  var notificationCount = "";

  @override
  void initState() {
    super.initState();
    getHomePageCount();
  }

  String userName = "";
  HomePageItemModel homePageCount = HomePageItemModel();

  getHomePageCount() async {
    FarmerLoginModel local = await LocalDatas().getLoginLocalDatas();
    setState(() {
      userName = local.data!.name.toString();
    });
    var provider = Provider.of<DataProvider>(context, listen: false);
    await provider.homePageLoading(context);
    setState(() {
      try {
        homePageCount = provider.getHomeDetails();
        itemCount = homePageCount.data!.itemCount.toString();
        liveAuctionCount = homePageCount.data!.liveAuctionCount.toString();
        shortlistBidCount = homePageCount.data!.shortlistBidCount.toString();
        poCount = homePageCount.data!.poCount.toString();
        notificationCount = homePageCount.data!.notificationCount.toString();
      } catch (e) {}
    });
  }

  Widget _homeView() {
    return ListView(shrinkWrap: true, children: [
      Column(children: [
        Container(
          padding:
              const EdgeInsets.only(top: 40, left: 15, right: 5, bottom: 10),
          width: double.infinity,
          child: Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 5, 5),
                            child: Text(
                              userName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Color(0xff000000)),
                            )),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Text(
                            "Welcome to Myprice",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ],
                    )),
                    InkWell(
                        child: Container(
                            height: 45,
                            width: 45,
                            margin: const EdgeInsets.only(top: 10),
                            child: Stack(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: InkWell(
                                      child: Icon(
                                        Icons.notifications_none,
                                        size: 30,
                                        color: app_primary,
                                      ),
                                    )),
                                notificationCount == ""
                                    ? Container()
                                    : Positioned(
                                        top: 0,
                                        right: 3,
                                        child: Container(
                                          height: 24,
                                          width: 24,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(
                                                50), //border corner radius
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.lightBlueAccent,
                                                spreadRadius: 1, //spread radius
                                              ),
                                              //you can set more BoxShadow() here
                                            ],
                                          ),
                                          child: Text(notificationCount,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14)),
                                        )),
                              ],
                            )),
                        onTap: () {
                          Navigator.pushNamed(context, dailyTask);
                        }),
                  ])),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Row(children: [
                  Expanded(
                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "My Daily Tasks",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xff000000)),
                          ),
                        ),

                        Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "You have add $itemCount Crops quantity",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            )),
                        //     Container(
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(5), //border corner radius
                            boxShadow: [
                              BoxShadow(
                                //color of shadow
                                color: Colors.grey,
                                spreadRadius: 1, //spread radius
                              ),
                            ],
                          ),
                          child: InkWell(
                              child: Text(
                                "Explore",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, tempPage,
                                    arguments: "My Daily Tasks");
                              }),
                        ),
                        //     ),
                      ])),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Color(0xffe7efa2), shape: BoxShape.circle),
                    margin: EdgeInsets.all(5),
                    child: Icon(
                      Icons.note_add,
                      size: 40,
                      color: Colors.white,
                    ),
                  )
                ])),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Row(children: [
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "My Crops",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xff000000)),
                          ),
                        ),

                        Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "You have $itemCount Crops in your collection",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            )),
                        //     Container(
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(5), //border corner radius
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1, //spread radius
                              ),
                            ],
                          ),
                          child: InkWell(
                              child: Text(
                                "Explore",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, tempPage,
                                    arguments: "My Crops");
                              }),
                        ),
                        //     ),
                      ])),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                        color: Color(0xff90EE90), shape: BoxShape.circle),
                    margin: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.not_listed_location_sharp,
                      size: 40,
                      color: Colors.white,
                    ),
                  )
                ])),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Row(children: [
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "My Auctions",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: const Color(0xff000000)),
                          ),
                        ),

                        Container(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "You have $liveAuctionCount live auctions",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            )),
                        //     Container(
                        Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(5), //border corner radius
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1, //spread radius
                              ),
                            ],
                          ),
                          child: InkWell(
                              child: Text(
                                "Explore",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, tempPage,
                                    arguments: "My Auctions");
                              }),
                        ),
                        //     ),
                      ])),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                        color: Color(0xfff1cd8b), shape: BoxShape.circle),
                    margin: const EdgeInsets.all(15),
                    child: const Icon(
                      Icons.autofps_select_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                  )
                ])),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Row(children: [
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "My Transactions",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xff000000)),
                          ),
                        ),

                        Container(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "You have $poCount transactions currently recorded",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            )),
                        //     Container(
                        Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(5), //border corner radius
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1, //spread radius
                              ),
                            ],
                          ),
                          child: InkWell(
                              child: Text(
                                "Explore",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, tempPage,
                                    arguments: "My Transactions");
                              }),
                        ),
                        //     ),
                      ])),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                        color: Color(0xffB0E0E6), shape: BoxShape.circle),
                    margin: const EdgeInsets.all(15),
                    child: const Icon(
                      Icons.price_change,
                      size: 40,
                      color: Colors.white,
                    ),
                  )
                ])),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Row(children: [
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "My Bids",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xff000000)),
                          ),
                        ),

                        Container(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "You have $shortlistBidCount Bids which are shortlisted",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            )),
                        //     Container(
                        Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(5), //border corner radius
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1, //spread radius
                              ),
                            ],
                          ),
                          child: InkWell(
                              child: Text(
                                "Explore",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, tempPage,
                                    arguments: "My Bids");
                              }),
                        ),
                        //     ),
                      ])),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                        color: Color(0xffD8BFD8), shape: BoxShape.circle),
                    margin: const EdgeInsets.all(15),
                    child: const Icon(
                      Icons.file_copy,
                      size: 40,
                      color: Colors.white,
                    ),
                  )
                ])),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Row(children: [
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            "Transaction Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xff000000)),
                          ),
                        ),

                        //     Container(
                        Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(left: 5, top: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(5), //border corner radius
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1, //spread radius
                              ),
                            ],
                          ),
                          child: InkWell(
                              child: Text(
                                "Explore",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, tempPage,
                                    arguments: "Transaction Details");
                              }),
                        ),
                        //     ),
                      ])),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                        color: Color(0xff8ad6ef), shape: BoxShape.circle),
                    margin: const EdgeInsets.all(15),
                    child: const Icon(
                      Icons.notifications,
                      size: 40,
                      color: Colors.white,
                    ),
                  )
                ])),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Row(children: [
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            "Vendor Ledger",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xff000000)),
                          ),
                        ),

                        //     Container(
                        Container(
                          margin: const EdgeInsets.only(left: 5, top: 15),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(5), //border corner radius
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1, //spread radius
                              ),
                            ],
                          ),
                          child: InkWell(
                              child: Text(
                                "Explore",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, tempPage,
                                    arguments: "Vendor Ledger");
                              }),
                        ),
                        //     ),
                      ])),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                        color: Color(0xffFFE4C4), shape: BoxShape.circle),
                    margin: const EdgeInsets.all(15),
                    child: const Icon(
                      Icons.cloud_queue,
                      size: 40,
                      color: Colors.white,
                    ),
                  )
                ])),
          ),
        ),
      ])
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: app_col,
        //   title: Text("My Prices"),
        // ),
        body: _homeView());
  }
}
