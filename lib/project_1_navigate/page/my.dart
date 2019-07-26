import 'package:flutter/material.dart';
import 'package:flutter_app_demo/project_1_navigate/router/router.dart';

//退出登录页面
class My extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('个人中心'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('登录'),
          onPressed: () {
            Navigator.of(context)
                .pushNamed(Router.getRouterPathByName("Login"));
          },
        ),
      ),
    );
  }
}
