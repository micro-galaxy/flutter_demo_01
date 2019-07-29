import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_demo/project_1_navigate/router/router.dart';

void main() {
  runApp(new MyApp());
// 沉浸式状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demos',
      theme: new ThemeData(primaryColor: Color(0xFF1296DB)),
//      注册所有页面路由
      routes: Router.getRouters(),
    );
  }
}
