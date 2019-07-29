import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/project_1_navigate/router/router.dart';

class FunctionMenus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FunctionMenusPage();
  }
}

class FunctionMenusPage extends State<FunctionMenus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 5),
                blurRadius: 12.0,
                spreadRadius: 3.0)
          ]),
      padding: EdgeInsets.only(left: 8, top: 3, bottom: 3),
      margin: EdgeInsets.all(12),
//      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          getFunctionItem(context, "images/order.png", "我的订单",
              (details) => onOrderTapUp(context, details)),
          getLine(),
          getFunctionItem(context, "images/recommend.png", "意见反馈",
              (details) => onOrderTapUp(context, details)),
          getLine(),
          getFunctionItem(context, "images/setting.png", "设置",
              (details) => onOrderTapUp(context, details)),
        ],
      ),
    );
  }

//  功能菜单列表item
  Widget getFunctionItem(BuildContext context, String imgAssetPath,
      String funcName, Function callBack) {
    return GestureDetector(
      onTapUp: callBack,
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width - 50,
        height: 52,
        padding: EdgeInsets.only(top: 12, bottom: 12),
        child: Row(
          children: <Widget>[
            getIcon(context, imgAssetPath),
            getFuncName(context, funcName),
            getArrow()
          ],
        ),
      ),
    );
  }

//  icon图标
  Widget getIcon(BuildContext context, String imgAssetPath) {
    return Container(
        height: 56,
        width: 56,
        alignment: Alignment.center,
        child: Image.asset(imgAssetPath));
  }

//  功能名称
  Widget getFuncName(BuildContext context, String funcName) {
    return Container(
      width: MediaQuery.of(context).size.width - 166,
      child: Text(
        funcName,
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }

//  右边箭头
  Widget getArrow() {
    return Container(
        padding: EdgeInsets.all(3),
        height: 56,
        width: 56,
        alignment: Alignment.centerRight,
        child: Image.asset("images/rightArrow.png"));
  }

//  底部横线
  Widget getLine() {
    return Container(
      margin: EdgeInsets.only(left: 18, right: 22),
      color: Colors.grey,
      height: 0.2,
    );
  }

//  点击我的订单
  void onOrderTapUp(BuildContext context, TapUpDetails details) {
    Navigator.pushNamed(context, Router.getRouterPathByName("OrderList"));
  }
}
