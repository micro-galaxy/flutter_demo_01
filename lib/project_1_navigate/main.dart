import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_demo/project_1_navigate/provider/providerState.dart';
import 'package:flutter_app_demo/project_1_navigate/router/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      //全局状态管理mode数据注册
      builder: (context) => new ProviderState(),
      child: MyApp()));

  //沉浸式状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  //全局异常监控
  FlutterError.onError = (FlutterErrorDetails details) {
    //TODO 后期异常上传服务器
    print(" ==>全局异常捕获: " + json.encode(details));
  };
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demos',
      theme: new ThemeData(
          primaryColor: Color(0xFF1296DB), platform: TargetPlatform.iOS),
      //注册所有页面路由
      routes: Router.getRouters(),
    );
  }
}
