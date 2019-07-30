import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/project_1_navigate/page/videoComponents/videoList.dart';
import 'package:flutter_app_demo/project_1_navigate/page/videoComponents/videoPlayer.dart';

class VideoPlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoPlayState();
  }
}

class VideoPlayState extends State<VideoPlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("视频播放"),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[new VideoPlayPlugin(), new VideoList()],
      ),
    );
  }
}
