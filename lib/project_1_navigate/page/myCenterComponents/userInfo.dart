import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UserInfoPage();
  }
}

class UserInfoPage extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12.0),
      alignment: Alignment.topLeft,
      width: MediaQuery.of(context).size.width,
      height: 160.0,
      color: Color(0xFF1296DB),
      child: Row(
        children: <Widget>[avatar(context), userName(context)],
      ),
    );
  }

//  用户名称
  Widget userName(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
        width: MediaQuery.of(context).size.width * (2 / 3),
        height: 80.0,
        child: Center(
            child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "哈哈",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                "12345678",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
        )));
  }

  //  用户头像
  Widget avatar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
      width: 80.0,
      height: 80.0,
      child: CircleAvatar(
        //头像半径
        radius: 50,
        //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
        backgroundImage: NetworkImage(
            'https://upload-images.jianshu.io/upload_images/3673902-3bce60950bb63c7a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/247/format/webp'),
      ),
    );

    CircleAvatar(
      //头像半径
      radius: 60,
      //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
      backgroundImage: NetworkImage(
          'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg'),
    );
  }
}
