import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/project_1_navigate/http/http.dart';
import 'package:flutter_app_demo/project_1_navigate/provider/providerState.dart';
import 'package:flutter_app_demo/project_1_navigate/storage/storage.dart';
import 'package:flutter_app_demo/project_1_navigate/utils/publicWidget.dart';
import 'package:provider/provider.dart';

class VideoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoListState();
  }
}

class VideoListState extends State<VideoList> {
  BuildContext context;
  double width;
  double height;

  //状态管理对象
  ProviderState providerState;

  //视频列表widget
  List<Widget> videoWidgets = [];
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    this.providerState = Provider.of<ProviderState>(context);

    var scrollController = ScrollController();

    initData();

    return Container(
      child: Column(
        children: <Widget>[
          getVideoListTitleWidget(),
          Container(
            width: width,
            height: 0.3,
            color: Colors.black54,
          ),
          Expanded(
            child: Container(
//            height: height * 0.563,
              child: ListView(
                  controller: scrollController, children: videoWidgets),
            ),
          )
        ],
      ),
    );
  }

  //初始化视频数据
  void initData() {
    //1，网络加载视频数据
//    List<Map<String, Object>> videoInfoList = requestVideoInfos();

    //2，调用全局状态管理渲染数据
//    providerState.initVideoInfo(videoInfoList);

    //3，渲染界面
    renderVideosWidget([]);
  }

  //网络请求获取视频列表
  List<Map<String, Object>> requestVideoInfos() {}

  //渲染视频列表界面
  void renderVideosWidget(List<Map<String, Object>> videoInfoList) {
    List<Widget> videoList = [];

    for (var i = 0; i < 10; i++) {
      videoList.add(getVideoListItemWidget(
          i.toString(),
          '视频名称视频名称视频名称视频名称视频名称视频名称$i',
          (videoId, details) => {
                PublicWidget.showSnackBar(
                    context: context,
                    text: "数据获取成功",
                    textColor: Colors.white,
                    backgroundColor: Colors.green)
              }));
      if (i < 10 - 1) {
        videoList.add(getLineWidget());
      }
    }

    setState(() {
      videoWidgets = videoList;
    });
  }

  //点击下载视频

  //视频列表标题
  Widget getVideoListTitleWidget() {
    return Container(
      height: height * 0.05,
      padding: EdgeInsets.only(left: 12),
      margin: EdgeInsets.only(bottom: 6),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.view_headline,
            color: Colors.blue,
            size: 28,
          ),
          new SizedBox(
            width: 6,
            height: 0,
          ),
          Text(
            "视频列表",
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  //单个视频样式
  Widget getVideoListItemWidget(
      String videoId, String videoName, Function onTapUpCallback) {
    return Container(
      height: height * 0.055,
      width: width,
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 12,
            height: 0,
          ),
          Icon(
            Icons.videocam,
            color: Colors.blue,
            size: 34,
          ),
          SizedBox(
            width: 12,
            height: 0,
          ),
          //添加点击事件
          GestureDetector(
            onTapUp: (details) => onTapUpCallback(videoId, details),
            //            视频名称
            child: Container(
              width: width * 0.68,
              child: Text(
                videoName,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
          ),
          getCatchBottomWidget(catchVideo)
        ],
      ),
    );
  }

  //缓存视频
  //TODO 具体数据从 全局状态参数 获取
  Future catchVideo(TapUpDetails details) async {
    try {
      File file = await Storage.getLocalFile("tencent.mp4");

      Http.download(
          context: context,
          url:
              "http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136ffd93020457e3c4ff02024ef202031e8d7f02030f42400204045a320a0201000400",
          savePath: file.path,
          progressCallback: (count, total) {
            providerState.setProgress(count / total);
//            setState(() {
//              progress = count / total;
//            });
          });
    } catch (e) {
      print(" ==>文件下载错误：" + json.decode(e));
    }
  }

  //缓存视频按钮
  Widget getCatchBottomWidget(Function catchCallback) {
    return GestureDetector(
      onTapUp: (details) => catchCallback(details),
      child: Container(
        width: 50,
        height: height * 0.05,
        //TODO 根据是否已缓存显示控件逻辑
        child: catchButtonWidget(false),
      ),
    );
  }

  //缓存按钮widget
  Widget catchButtonWidget(bool catched) {
    return Column(
      children: <Widget>[
        Icon(
          Icons.cloud_download,
          color: catched ? Colors.green : Colors.grey,
          size: 20,
        ),
        Text(
          catched ? "已缓存" : "缓存",
          style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700),
        )
      ],
    );
  }

  //缓存进度widget
  Widget catchProgressWidget(double progress) {
    return Container(
      //可根据条件显示、隐藏
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        value: progress,
      ),
    );
  }
}

//视频列表分割线
Widget getLineWidget() {
  return Container(
    margin: EdgeInsets.only(left: 18, right: 22),
    color: Colors.grey,
    height: 0.3,
  );
}
