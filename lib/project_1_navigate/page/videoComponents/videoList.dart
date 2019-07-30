import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_demo/project_1_navigate/storage/storage.dart';
import 'package:path_provider/path_provider.dart';

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

  //全局视频信息管理（包含下载状态、下载进度、当前播放状态）
  Map<String, Map<String, String>> videoInfo;

  //测试下载进度
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    var scrollController = ScrollController();
    return Container(
      child: Column(
        children: <Widget>[
          getVideoListTitle(),
          Container(
            height: height * 0.571,
            child: ListView(
                controller: scrollController, children: getVideoList()),
          )
        ],
      ),
    );
  }

//  网络请求获取视频列表
  List<Widget> getVideoList() {
    List<Widget> videoList = [];

    for (var i = 0; i < 10; i++) {
      videoList.add(getVideoListItem(i.toString(), '视频名称视频名称视频名称视频名称视频名称视频名称$i',
          (videoId, details) => {}));
      if (i < 10 - 1) {
        videoList.add(getLine());
      }
    }

    return videoList;
  }

//  点击下载视频

//  视频列表标题
  Widget getVideoListTitle() {
    return Container(
      height: height * 0.05,
      padding: EdgeInsets.only(left: 12),
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

//  单个视频样式
  Widget getVideoListItem(
      String videoId, String videoName, Function onTapUpCallback) {
    return Container(
      height: height * 0.05,
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

          getCatchBottom(catchVideo)
        ],
      ),
    );
  }

  //缓存视频
  //TODO 具体数据从 全局状态参数 获取
  Future catchVideo(TapUpDetails details) async {
    try {
      File file = await Storage.getLocalFile("tencent.mp4");

      Response response = await Dio().download(
          "http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136ffd93020457e3c4ff02024ef202031e8d7f02030f42400204045a320a0201000400",
          file.path, onReceiveProgress: (count, total) {
        setState(() {
          progress = count / total;
        });
      });
    } catch (Exception) {}
  }

//  缓存视频按钮
  Widget getCatchBottom(Function catchCallback) {
    //            视频缓存按钮
    return GestureDetector(
      onTapUp: (details) => catchCallback(details),
      child: Container(
        width: 50,
        height: 50,
//              color: Colors.red,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 30,
              height: 30,
              //                    可根据条件显示、隐藏
              child: Offstage(
                offstage: false,
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                  value: progress,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
//                    可根据条件显示、隐藏
              child: Offstage(
                offstage: false,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.cloud_download,
                      color: Colors.blue,
                    ),
                    Text(
                      "缓存",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//  视频列表分割线
  Widget getLine() {
    return Container(
      margin: EdgeInsets.only(left: 18, right: 22),
      color: Colors.grey,
      height: 0.3,
    );
  }
}
