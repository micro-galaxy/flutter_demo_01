import 'package:flutter/cupertino.dart';
import 'package:flutter_app_demo/project_1_navigate/navigate/navigate.dart';
import 'package:flutter_app_demo/project_1_navigate/page/home.dart';
import 'package:flutter_app_demo/project_1_navigate/page/login.dart';
import 'package:flutter_app_demo/project_1_navigate/page/my.dart';
import 'dart:convert';

//路由配置
final List<Map> _routers = [
  {
    "name": "root",
    "path": "/",
    "page": (BuildContext build) => new Navigate(),
  },
  {
    "name": "Home",
    "path": "/home",
    "page": (BuildContext build) => new Home(),
  },
  {
    "name": "My",
    "path": "/my",
    "page": (BuildContext build) => new My(),
  },
  {
    "name": "Login",
    "path": "/login",
    "page": (BuildContext build) => new Login(),
  },
];

class Router {
//  返回mainApp注册路由所需的路由数据
  static Map<String, WidgetBuilder> getRouters() {
    Map<String, WidgetBuilder> _registerRoutes = {};
    _routers.forEach((route) => _registerRoutes[route['path']] = route['page']);
    return _registerRoutes;
  }

//  通过路由名称获取路由路径，示例：Navigator.of(context).pushNamed(getRouterPathByName("Home"))
  static String getRouterPathByName(String routerName) {
    if (null == routerName || routerName.isEmpty) {
      throw new Exception('Invalid route name: $routerName');
    }

    String routerPath;
    _routers.forEach((v) {
      if (null == routerPath && v["name"] == routerName) {
        routerPath = v["path"];
      }
    });

    if (null == routerPath) {
      throw new Exception('route path not found: $routerName');
    }
    return routerPath;
  }
}
