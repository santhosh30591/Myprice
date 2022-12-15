import 'package:flutter/material.dart';
import 'package:myprice/model/daily_task_model.dart';
import 'package:myprice/model/notification_list.dart';
import 'package:myprice/providers/dataProvider.dart';
import 'package:myprice/utils/not_date_widget.dart';
import 'package:myprice/utils/theams.dart';
import 'package:provider/provider.dart';

class DailyWidget extends StatefulWidget {
  const DailyWidget({key});

  @override
  State<DailyWidget> createState() => _DailyWidgetState();
}

class _DailyWidgetState extends State<DailyWidget> {
  var token = "";
  int lengthfile = 0;
  DailyTaskModel dailyTaskModel = DailyTaskModel();
  @override
  void initState() {
    super.initState();
    dailyTaskModel.message = "Please wait loading...";

    loadingDetails();
  }

  loadingDetails() async {
    final postMdl = Provider.of<DataProvider>(context, listen: false);
    await postMdl.dailyTaskList(context);

    setState(() {
      try {
        dailyTaskModel = postMdl.dailyTaskModel;
        lengthfile = dailyTaskModel.data!.items!.length;
      } catch (e) {}
    });
  }

  var counts = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: app_col,
          title: const Text("Daily Task"),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: lengthfile == 0 ? emptyDatas() : apiLoading());

    // body: emptyDatas();
  }

  Widget apiLoading() {
    return ListView.builder(
        itemCount: dailyTaskModel.data!.items!.length,
        itemBuilder: (context, i) {
          return Container(
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
                    width: double.maxFinite,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                              child: Container(
                            height: 140,
                            width: 140,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(15),
                            // color: Colors.amber,
                            child: Image.network(
                              dailyTaskModel.data!.items![i].item!.imageUrl
                                  .toString(),
                              errorBuilder: (context, error, stackTrace) {
                                return Text(
                                  '😢',
                                  style: TextStyle(fontSize: 50),
                                );
                              },
                            ),
                          )),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(10, 0, 5, 5),
                            child: Text(
                              dailyTaskModel.data!.items![i].item!.materialName
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xff000000)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  dailyTaskModel.data!.items![i]
                                          .availableQuantity!.quantity
                                          .toString() +
                                      " " +
                                      dailyTaskModel.data!.items![i]
                                          .availableQuantity!.unit
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(10),
                                height: 25,
                                width: 25,
                                color: Colors.amber,
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ])),
              ));
        });
  }
}
