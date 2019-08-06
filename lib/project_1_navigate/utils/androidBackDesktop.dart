import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

///页面点击返回，返回到桌面，不退出app
///利用flutter调用原生代码
///需要在FlutterActivity下注册原生代码
class AndroidBackDesktop {
  //通讯通道名称
  static const String chanel = "android/back/desktop";

  //通讯事件名称
  static const String eventName = "backDesktop";

  //调用原生代码（返回到桌面）
  static Future<bool> backDesktop() async {
    //建立通道
    final chanelObj = MethodChannel(chanel);
    try {
      //发送信息
      await chanelObj.invokeMethod(eventName);
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
    return Future.value(false);
  }
}
