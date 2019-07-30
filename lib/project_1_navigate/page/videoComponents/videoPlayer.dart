import 'package:auto_orientation/auto_orientation.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayPlugin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoPlayPluginState();
  }
}

class VideoPlayPluginState extends State<VideoPlayPlugin> {
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(
        'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136ffd93020457e3c4ff02024ef202031e8d7f02030f42400204045a320a0201000400');
    _videoPlayerController2 = VideoPlayerController.network(
        'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136ffd93020457e3c4ff02024ef202031e8d7f02030f42400204045a320a0201000400');
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController1,
        aspectRatio: 3 / 2,
        autoPlay: true,
        looping: true,
        routePageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondAnimation, provider) {
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget child) {
              return VideoScaffold(
                child: Container(
                  height: MediaQuery.of(context).size.width * (9 / 16),
                  child: Scaffold(
                    resizeToAvoidBottomPadding: false,
                    body: Container(
                      alignment: Alignment.center,
                      color: Colors.black,
                      child: provider,
                    ),
                  ),
                ),
              );
            },
          );
        }
        // Try playing around with some of these other options:

        // showControls: false,
        // materialProgressColors: ChewieProgressColors(
        //   playedColor: Colors.red,
        //   handleColor: Colors.blue,
        //   backgroundColor: Colors.grey,
        //   bufferedColor: Colors.lightGreen,
        // ),
        // placeholder: Container(
        //   color: Colors.grey,
        // ),
        // autoInitialize: true,
        );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("视频播放"),
//      ),
//      body:

    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width * (9 / 16),
          child: Center(
            child: Chewie(
              controller: _chewieController,
            ),
          ),
        ),
//        FlatButton(
//          onPressed: () {
//            _chewieController.enterFullScreen();
//          },
//          child: Text('Fullscreen'),
//        ),
//        Row(
//          children: <Widget>[
//            Expanded(
//              child: FlatButton(
//                onPressed: () {
//                  setState(() {
//                    _chewieController.dispose();
//                    _videoPlayerController2.pause();
//                    _videoPlayerController2.seekTo(Duration(seconds: 0));
//                    _chewieController = ChewieController(
//                      videoPlayerController: _videoPlayerController1,
//                      aspectRatio: 3 / 2,
//                      autoPlay: true,
//                      looping: true,
//                    );
//                  });
//                },
//                child: Padding(
//                  child: Text("Video 1"),
//                  padding: EdgeInsets.symmetric(vertical: 16.0),
//                ),
//              ),
//            ),
//            Expanded(
//              child: FlatButton(
//                onPressed: () {
//                  setState(() {
//                    _chewieController.dispose();
//                    _videoPlayerController1.pause();
//                    _videoPlayerController1.seekTo(Duration(seconds: 0));
//                    _chewieController = ChewieController(
//                      videoPlayerController: _videoPlayerController2,
//                      aspectRatio: 3 / 2,
//                      autoPlay: true,
//                      looping: true,
//                    );
//                  });
//                },
//                child: Padding(
//                  padding: EdgeInsets.symmetric(vertical: 16.0),
//                  child: Text("Video 2"),
//                ),
//              ),
//            )
//          ],
//        ),
//        Row(
//          children: <Widget>[
//            Expanded(
//              child: FlatButton(
//                onPressed: () {
//                  setState(() {
////                      _platform = TargetPlatform.android;
//                  });
//                },
//                child: Padding(
//                  child: Text("Android controls"),
//                  padding: EdgeInsets.symmetric(vertical: 16.0),
//                ),
//              ),
//            ),
//            Expanded(
//              child: FlatButton(
//                onPressed: () {
//                  setState(() {
////                      _platform = TargetPlatform.iOS;
//                  });
//                },
//                child: Padding(
//                  padding: EdgeInsets.symmetric(vertical: 16.0),
//                  child: Text("iOS controls"),
//                ),
//              ),
//            )
//          ],
//        )
      ],
    );
  }
}

class VideoScaffold extends StatefulWidget {
  const VideoScaffold({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => _VideoScaffoldState();
}

class _VideoScaffoldState extends State<VideoScaffold> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    AutoOrientation.landscapeMode();
    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    AutoOrientation.portraitMode();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
