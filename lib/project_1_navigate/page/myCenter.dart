import 'package:flutter/material.dart';

import 'myCenterComponents/functionMenus.dart';
import 'myCenterComponents/userInfo.dart';

//退出登录页面
class My extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("个人中心"),
          elevation: 0,
        ),
//        特殊布局设置（一个组件显示在另一个组件之上，ui效果）
        body: Stack(
          children: <Widget>[
            Scaffold(
              body: new UserInfo(),
            ),
            Positioned(
              top: 120,
              right: 6,
              left: 6,
              child: new FunctionMenus(),
            )
          ],
        ));
  }
}
