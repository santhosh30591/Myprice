import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myprice/model/getTestdata.dart';
import 'package:myprice/providers/dataProvider.dart';
import 'package:provider/provider.dart';

class ProviderDemoScreen extends StatefulWidget {
  @override
  _ProviderDemoScreenState createState() => _ProviderDemoScreenState();
}

class _ProviderDemoScreenState extends State<ProviderDemoScreen> {
  @override
  void initState() {
    super.initState();
    final postMdl = Provider.of<DataProvider>(context, listen: false);
    // postMdl.getDataProviderResponces(context);
  }

  @override
  Widget build(BuildContext context) {
    // final postMdl = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          // child: postMdl.loading
          //     ?
          child: Container(
            child: CircularProgressIndicator(),
          )
          // : Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Container(
          //         margin: EdgeInsets.only(top: 40, bottom: 20),
          //         child: Text(
          //           postMdl.post.title ?? "",
          //           style:
          //               TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          //         ),
          //       ),
          //       Container(
          //         child: Text(postMdl.post.body ?? ""),
          //       )
          //     ],
          //   ),
          ),
    );
  }
}
