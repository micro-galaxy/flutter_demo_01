import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PublicWidget {
  //底部下划线公共widget
  static Widget getLine({@required double left, @required double right}) {
    return Container(
      margin: EdgeInsets.only(left: left, right: right),
      color: Colors.grey,
      height: 0.2,
    );
  }

  //dialog对话框
  static void showDialog(
      {@required BuildContext context,
      @required String title,
      @required String text,
      @required Color textColor,
      Function cancelCall,
      @required Function confirmCall}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Container(
              height: 50,
              child: Text(title),
            ),
            content: Container(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child:
                  Text(text, style: TextStyle(fontSize: 16, color: Colors.red)),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  cancelCall != null && cancelCall();
                },
                child:
                    Text("取消", style: TextStyle(fontWeight: FontWeight.w700)),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  confirmCall != null && confirmCall();
                },
                child:
                    Text("确认", style: TextStyle(fontWeight: FontWeight.w700)),
              ),
            ],
          );
        });
  }

  //底部提示
  static void showSnackBar(
      {@required BuildContext context,
      @required String text,
      @required Color textColor,
      @required Color backgroundColor}) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
          content: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          backgroundColor: backgroundColor),
    );
  }
}
