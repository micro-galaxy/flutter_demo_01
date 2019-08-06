import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/project_1_navigate/router/router.dart';
import 'package:flutter_app_demo/project_1_navigate/storage/storage.dart';
import 'package:flutter_app_demo/project_1_navigate/utils/publicWidget.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingPage();
  }
}

class SettingPage extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("设置"),
          backgroundColor: Colors.blue,
        ),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 282,
                  margin: EdgeInsets.only(
                    top: 30,
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 5),
                            blurRadius: 12.0,
                            spreadRadius: 3.0)
                      ]),
                  child: Column(
                    children: <Widget>[
                      functionWidget("修改密码", () {
                        Navigator.of(context).pushNamed(
                            Router.getRouterPathByName("ModifyPass"));
                      }),
                      PublicWidget.getLine(left: 15, right: 10),
                      functionTextWidget("软件信息", "当前版本：1.2.2"),
                      PublicWidget.getLine(left: 15, right: 10),
                      functionWidget("清理缓存", () {
                        PublicWidget.showDialog(
                            context: context,
                            title: "确认清理缓存",
                            text: "将删除您缓存的所有视频文件",
                            textColor: Colors.red,
                            confirmCall: () {
                              PublicWidget.showSnackBar(
                                  context: context,
                                  text: "缓存清理成功",
                                  textColor: Colors.white,
                                  backgroundColor: Colors.green);
//                          Storage.getStorageInstance()
//                              .then((sharedPreferences) {
//                            sharedPreferences.remove("");
//                          });
                            });
                      }),
                      PublicWidget.getLine(left: 15, right: 10),
                      functionTextWidget("检查更新", "已是最新版本"),
                      PublicWidget.getLine(left: 15, right: 10),
                      functionWidget("关于检测网校", () {
                        Navigator.of(context)
                            .pushNamed(Router.getRouterPathByName("AppAbout"));
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                loginOut("退出登录", () {
                  //TODO 删除存储的登录信息、跳转登录页面
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Router.getRouterPathByName("Root"),
                      (route) => route == null);
                }),
              ],
            ),
          );
        }),
      ),
    );
  }

  //function widget
  Widget functionWidget(String funcName, Function callback) {
    return GestureDetector(
      onTapDown: (details) => callback(),
      child: Container(
        margin: EdgeInsets.all(3),
        color: Colors.white,
        height: 50,
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  funcName,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Icon(Icons.keyboard_arrow_right),
            )
          ],
        ),
      ),
    );
  }

  //function text
  Widget functionTextWidget(String funcName, String description) {
    return Container(
      margin: EdgeInsets.all(3),
      color: Colors.white,
      alignment: Alignment.center,
      height: 50,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 12),
              child: Text(funcName, style: TextStyle(fontSize: 18)),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              padding: EdgeInsets.only(right: 18),
              child: Text(description),
            ),
          )
        ],
      ),
    );
  }

  //退出登录
  Widget loginOut(String funcName, Function callback) {
    return GestureDetector(
      onTapDown: (details) => callback(),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blue,
          ),
          margin: EdgeInsets.all(25),
          height: 50,
          alignment: Alignment.center,
          child: Text(funcName,
              style: TextStyle(fontSize: 18, color: Colors.white))),
    );
  }
}
