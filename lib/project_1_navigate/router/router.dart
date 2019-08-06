import 'package:flutter/cupertino.dart';
import 'package:flutter_app_demo/project_1_navigate/navigate/navigate.dart';
import 'package:flutter_app_demo/project_1_navigate/page/appAbout.dart';
import 'package:flutter_app_demo/project_1_navigate/page/feedback.dart';
import 'package:flutter_app_demo/project_1_navigate/page/home.dart';
import 'package:flutter_app_demo/project_1_navigate/page/login.dart';
import 'package:flutter_app_demo/project_1_navigate/page/modifyPass.dart';
import 'package:flutter_app_demo/project_1_navigate/page/myCenter.dart';
import 'package:flutter_app_demo/project_1_navigate/page/orderList.dart';
import 'package:flutter_app_demo/project_1_navigate/page/setting.dart';
import 'package:flutter_app_demo/project_1_navigate/page/videoPlay.dart';

//路由配置
final List<Map> _routers = [
  {
    "name": "Root",
    "path": "/",
    "page": new Login(),
  },
  {
    "name": "AppNavigate",
    "path": "/navigate",
    "page": new Navigate(),
  },
  {
    "name": "Home",
    "path": "/home",
    "page": new Home(),
  },
  {
    "name": "My",
    "path": "/my",
    "page": new My(),
  },
  {
    "name": "Login",
    "path": "/login",
    "page": new Login(),
  },
  {
    "name": "OrderList",
    "path": "/orderList",
    "page": new OrderList(),
  },
  {
    "name": "VideoPlay",
    "path": "/videoplay",
    "page": new VideoPlay(),
  },
  {
    "name": "Feedback",
    "path": "/feedback",
    "page": new Feedback(),
  },
  {
    "name": "Setting",
    "path": "/setting",
    "page": new Setting(),
  },
  {
    "name": "ModifyPass",
    "path": "/modifyPass",
    "page": new ModifyPass(),
  },
  {
    "name": "AppAbout",
    "path": "/appabout",
    "page": new AppAbout(),
  },
];

class Router {
//  返回mainApp注册路由所需的路由数据
  static Map<String, WidgetBuilder> getRouters() {
    Map<String, WidgetBuilder> _registerRoutes = {};
    _routers.forEach((route) =>
        _registerRoutes[route['path']] = (BuildContext build) => route['page']);
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
