import 'package:flutter/material.dart';
import 'package:myprice/intro/intoslide.dart';
import 'package:myprice/router/router.dart';
import 'package:myprice/utils/local_data.dart';
import 'package:myprice/utils/theams.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({key});
  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  var _chosenValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: app_col,
      //   title: Text("Settings"),
      // ),
      body: Container(
          // margin: EdgeInsets.all(15),
          padding:
              const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Change languages :",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                width: double.infinity,
                height: 45,
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(10), //border corner radius
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffdcdbdb),
                      spreadRadius: 1, //spread radius
                    ),
                  ],
                ),
                child: DropdownButton<String>(
                  underline: SizedBox(),
                  value: _chosenValue,
                  //elevation: 5,
                  style: TextStyle(color: Colors.black, fontSize: 16),

                  items: <String>[
                    'Englist',
                    'Hindi',
                    'karnataka',
                    'Tamil',
                    'Telugu',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: Text(
                    "Please choose a langauage",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _chosenValue = value;
                    });
                  },
                ),
              ),
              Container(
                  height: 45,
                  margin: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(10), //border corner radius
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffdcdbdb),
                            spreadRadius: 1, //spread radius
                          ),
                        ],
                      ),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Terms & Conditions",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    onTap: () {
                      // showLogout(context);
                    },
                  )),
              Container(
                  height: 45,
                  margin: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(10), //border corner radius
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffdcdbdb),
                            spreadRadius: 1, //spread radius
                          ),
                        ],
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Share",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    onTap: () {
                      // showLogout(context);
                    },
                  )),
              Container(
                  height: 45,
                  margin: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(10), //border corner radius
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffdcdbdb),
                            spreadRadius: 1, //spread radius
                          ),
                        ],
                      ),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "How is Working",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    onTap: () {
                      // showLogout(context);
                    },
                  )),
              Container(
                  margin: const EdgeInsets.only(
                      left: 20, top: 30, right: 20, bottom: 10),
                  child: InkWell(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: app_primary,
                        borderRadius:
                            BorderRadius.circular(15), //border corner radius
                        boxShadow: const [
                          BoxShadow(
                            //color of shadow
                            color: Colors.amber,
                            spreadRadius: 1, //spread radius
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Logout",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      showLogout(context);
                    },
                  )),
            ],
          )),
    );
  }

  void showLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Confirm?"),
        content: const Text('Are you sure you want to Sign Out?'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'NO',
              style: TextStyle(fontSize: 14, color: Colors.amber),
            ),
          ),
          TextButton(
            onPressed: () async {
              LocalDatas().dbLogout();
              Navigator.pushReplacementNamed(context, terms);
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => IntroSliderDemo()));
            },
            child: const Text(
              'YES',
              style: TextStyle(fontSize: 14, color: Colors.amber),
            ),
          ),
        ],
      ),
    );
  }
}
