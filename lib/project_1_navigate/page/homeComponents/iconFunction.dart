import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconFunction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new IconFunctionPage();
  }
}

class IconFunctionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _getFunctionList()));
  }

  List<Widget> _getFunctionList() {
    List<Widget> iconWidgetList = [];

    iconWidgetList.add(Container(
        //          添加阴影效果
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                color: Color(0xFFF3CA7E),
                offset: Offset(5, 5),
                blurRadius: 16.0,
                spreadRadius: 2.0),
          ],
        ),
        child: new IconButton(
//            iconSize: 60,
            padding: EdgeInsets.all(0),
            icon: Image.asset("images/orange.png"),
            onPressed: () {
//              TODO 添加icon方法处理
            })));

    iconWidgetList.add(Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                color: Color(0xFFF3CA7E),
                offset: Offset(5, 5),
                blurRadius: 16.0,
                spreadRadius: 2.0),
          ],
        ),
        child: new IconButton(
            padding: EdgeInsets.all(0),
            icon: Image.asset("images/orange.png"),
            onPressed: () {})));

    iconWidgetList.add(Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                color: Color(0xFFF3CA7E),
                offset: Offset(5, 5),
                blurRadius: 16.0,
                spreadRadius: 2.0),
          ],
        ),
        child: new IconButton(
            padding: EdgeInsets.all(0),
            icon: Image.asset("images/orange.png"),
            onPressed: () {})));

    iconWidgetList.add(Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                color: Color(0xFFF3CA7E),
                offset: Offset(5, 5),
                blurRadius: 16.0,
                spreadRadius: 2.0),
          ],
        ),
        child: new IconButton(
            padding: EdgeInsets.all(0),
            icon: Image.asset("images/orange.png"),
            onPressed: () {})));

    return iconWidgetList;
  }
}
