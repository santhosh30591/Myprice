import 'package:flutter/material.dart';
import 'package:myprice/model/farmermodel.dart';
import 'package:myprice/utils/local_data.dart';
import 'package:myprice/utils/theams.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({key});

  @override
  State<ProfileWidget> createState() => _UrofileWidgetState();
}

var userName = "";
var farmerid = "";
var contact = "";
var address = "";

class _UrofileWidgetState extends State<ProfileWidget> {
  @override
  void initState() {
    super.initState();
    getProfileDetails();
  }

  getProfileDetails() async {
    FarmerLoginModel local = await LocalDatas().getLoginLocalDatas();
    setState(() {
      userName = local.data!.name.toString();
      contact = local.data!.phoneNumber.toString();
      address = local.data!.address.toString();
      farmerid = local.data!.farmerNo.toString();
    });
  }

  Widget profile() {
    return Container(
      alignment: Alignment.center,
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),

            // padding: const EdgeInsets.all(20),
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Column(
                children: <Widget>[
                  Container(
                      decoration: const BoxDecoration(
                          color: Color(0xfff2f1f1), shape: BoxShape.circle),
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.person,
                        size: 90,
                        color: app_primary,
                      )),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Text(
                      userName,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 20, 20),
                    child: Text(
                      "Farmer No : " + farmerid,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            width: double.infinity,
            child: Card(
              elevation: 5,
              child: Container(
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: const Text(
                                "Poing of Contact",
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xffaaaaaa)),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                              child: Text(
                                contact,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: InkWell(
                              child: Icon(
                                Icons.call,
                                size: 30,
                                color: app_primary,
                              ),
                            ))
                      ])),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            width: double.infinity,
            child: Card(
              elevation: 5,
              child: Container(
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: const Text(
                                "Address",
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xffaaaaaa)),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                              child: Text(
                                address,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ],
                        )),
                        Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: InkWell(
                              child: Icon(
                                Icons.gps_fixed,
                                size: 30,
                                color: app_primary,
                              ),
                            ))
                      ])),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: app_col,
        //   title: const Text("Profile"),
        // ),
        body: SingleChildScrollView(child: profile()));
  }
}
