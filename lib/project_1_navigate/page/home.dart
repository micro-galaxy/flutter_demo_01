import 'package:flutter/material.dart';
import 'package:flutter_app_demo/project_1_navigate/navigate/navigate.dart';
import 'package:flutter_app_demo/project_1_navigate/utils/androidBackDesktop.dart';

import 'homeComponents/banner.dart';
import 'homeComponents/iconFunction.dart';
import 'homeComponents/search.dart';
import 'homeComponents/videoList.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new HomePage();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: Text(''),
            title: Text(
              "学习",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue,
            elevation: 0,
          ),
          body: Column(children: [
//        new Search(),
            new MyBanner(),
//            new IconFunction(),
            Expanded(
              child: new VideoList(),
            )
          ])),
    );
  }
}
