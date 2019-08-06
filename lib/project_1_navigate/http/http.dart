import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/project_1_navigate/router/router.dart';
import 'package:flutter_app_demo/project_1_navigate/storage/storage.dart';
import 'package:connectivity/connectivity.dart';

///封装了Dio网络组件，添加拦截器处理请求头、token等、401等逻辑
class Http {
  //get请求
  static Future<Response> get(
      {@required BuildContext context, @required String url}) async {
    var dio = await _getInstance(context: context, method: "GET");
    return await dio.get(url);
  }

  //post请求
  static Future<Response> post(
      {@required BuildContext context,
      @required String url,
      @required Map<String, dynamic> data}) async {
    var dio = await _getInstance(context: context, method: "POST");
    return await dio.post(url, data: data);
  }

  //post表单请求
  static Future<Response> postFrom(
      {@required BuildContext context,
      @required String url,
      @required FormData formData}) async {
    var dio = await _getInstance(context: context, method: "POST");
    return await dio.post(url, data: formData);
  }

  //文件下载
  static download(
      {@required BuildContext context,
      @required String url,
      @required String savePath,
      @required Function progressCallback}) async {
    var dio = await _getInstance(context: context, method: "GET");
    dio.download(url, savePath, onReceiveProgress: progressCallback);
  }

  //检查是否wifi
  static Future<bool> wifiStatus() async {
    return await Connectivity().checkConnectivity() == ConnectivityResult.wifi;
  }

  //检查网络是否可用
  static Future<bool> networkOk(BuildContext context) async {
    Response response =
        await get(context: context, url: "https://www.baidu.com/");
    return response.statusCode < 300;
  }

  static Future<Dio> _getInstance(
      {@required BuildContext context, @required String method}) async {
    var dio = new Dio();
    dio.options.baseUrl = "https://www.xx.com/api";
    dio.options.connectTimeout = 10000; //10s
    dio.options.sendTimeout = 1000;

    //获取token
    var storageInstance = await Storage.getStorageInstance();
    String token = storageInstance.get("token");

    //拦截器
    dio.interceptors.add(InterceptorsWrapper(
        //请求前拦截器
        onRequest: (RequestOptions options) {
      Map<String, String> header = Map();
      header.putIfAbsent("token", () => token ?? "");
      if (method.toUpperCase() != "GET") {
        header.putIfAbsent("Content-Type", () => "application/json");
      }
      options.headers = header;
    },
        //请求结果拦截器
        onResponse: (Response response) {
      if (response.statusCode == 401) {
        storageInstance.remove("token");
        storageInstance.remove("userId");
        Navigator.pushNamed(context, Router.getRouterPathByName("Login"));
      }
    },
        //发生错误拦截器
        onError: (DioError e) {
      //TODO 后期错误需要上传到服务器
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          "网络错误，请检查网络",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ));
      print(" ==>服务器异常：" + json.encode(e));
      return e;
    }));

    return dio;
  }
}
