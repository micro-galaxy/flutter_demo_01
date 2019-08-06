import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String _appAbout =
        "专注于职业教育类考试，为考生提供专业的线上试题、考前模考，资深讲师提供专业的课程讲解，考生可以在线上完成整套或专项的学习。";

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("关于我们"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 30, left: 12, right: 12),
          child: Text(
            _appAbout,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
