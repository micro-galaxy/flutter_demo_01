import 'package:flutter/material.dart';
import 'package:flutter_app_demo/project_1_navigate/page/home.dart';
import 'package:flutter_app_demo/project_1_navigate/page/my.dart';

class Navigate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _NavigateState();
  }
}

class _NavigateState extends State<Navigate> {
  int _currentIndex = 0;

//  底部路由包含两个页面
  final List<Widget> _children = [
    new Home(),
    new My(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('首页'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('我的'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
