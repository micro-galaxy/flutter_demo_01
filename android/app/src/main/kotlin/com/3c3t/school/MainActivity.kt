package com.3c3t.school

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel;

class MainActivity : FlutterActivity() {
    //通讯名称,回到手机桌面
    val chanel = "android/back/desktop"
    //返回手机桌面事件
    val eventBackDesktop = "backDesktop"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        this.getWindow().setStatusBarColor(0)
        GeneratedPluginRegistrant.registerWith(this)

        //注册flutter调用原生代码事件
        this.registerChanel()
    }

    //注册flutter调用原生代码事件
    fun registerChanel() {
//        new MethodChannel(getFlutterView(), chanel).setMethodCallHandler((methodCall, result) => {
//            if (methodCall.method.equals(eventBackDesktop)) {
//                moveTaskToBack(false)
//                result.success(true)
//            }
//        })
    }
}
