import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/project_1_navigate/router/router.dart';

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

  @override
  Widget build(BuildContext context) {
    this.context = context;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    final List<Tab> myTabs = <Tab>[
      new Tab(text: '我的视频'),
      new Tab(text: '所有视频'),
    ];

    return Container(
      margin: EdgeInsets.only(top: 12),
//      height: height * 0.538,
//      color: Colors.red,
      child: Column(
        children: <Widget>[
//          Container(
//            margin: EdgeInsets.only(left: 8, bottom: 4, right: 8, top: 8),
//            height: 0.5,
//            width: width,
//            color: Colors.black12,
//          ),
          Container(
//            padding: EdgeInsets.only(top: 12),
//            height: height * 0.036,
//            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 8,
                  height: 0,
                ),
                Icon(
                  Icons.class_,
                  size: 30,
                  color: Colors.blue,
                ),
                Text(
                  "视频课程",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
//            height: height * 0.4,
//            color: Colors.red,
              child: DefaultTabController(
                length: myTabs.length,
                child: Scaffold(
//                backgroundColor: Colors.teal,
                  appBar: PreferredSize(
                      preferredSize: Size.fromHeight(48),
                      child: AppBar(
                        backgroundColor: Colors.white12,
                        elevation: 0,
                        bottom: TabBar(
                          labelPadding: EdgeInsets.only(left: 46, right: 46),
                          labelStyle: TextStyle(fontSize: 16),
                          labelColor: Colors.blue,
                          unselectedLabelColor: Colors.black,
                          indicatorColor: Colors.blue,
                          tabs: myTabs,
                          isScrollable: true,
                        ),
                      )),
                  body: Container(
                    child: TabBarView(
                      children: [
                        requestVideos(),
                        requestVideos(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //模拟网络获取课程列表
  ListView requestVideos() {
    List<Widget> videos = [];
    for (var i = 0; i < 10; i++) {
      videos.add(SizedBox(
        height: 20,
      ));

      videos.add(videoItemWidget(
          videoId: "视频名称#$i",
          iconUrl:
              "https://iconfont.alicdn.com/t/1550898018467.jpeg@200h_200w.jpg",
          videoName: "视频名称#$i",
          videoDetail: "视频名称#$i",
          buyNum: "999"));
    }
    return ListView(
      children: videos,
    );
  }

  //点击课程列表item
  void videoOnTapUp(
      BuildContext context, TapUpDetails details, String videoId) {
    Navigator.of(context).pushNamed(Router.getRouterPathByName("VideoPlay"));
  }

  //课程列表item样式
  Widget videoItemWidget(
      {@required String videoId,
      @required String iconUrl,
      @required String videoName,
      @required String videoDetail,
      @required String buyNum}) {
    assert(videoId != null);
    assert(iconUrl != null);
    assert(videoName != null);

    return GestureDetector(
      onTapUp: (details) => videoOnTapUp(context, details, videoId),
      child: Container(
        width: width,
//      color: Colors.blue,
        child: Row(
          children: <Widget>[
            //视频icon图
            Container(
              margin: EdgeInsets.only(left: width * 0.02),
              width: width * 0.32,
              height: width * 0.26,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(iconUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                  ),
                  Positioned(
                    top: width * 0.09,
                    left: width * 0.11,
                    child: Icon(
                      Icons.play_circle_outline,
                      color: Colors.white,
                      size: width * 0.1,
                    ),
                  )
                ],
              ),
            ),
            //右边标题部分
            Container(
//              height: height * 0.125,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: width * 0.655,
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      videoName,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    width: width * 0.655,
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      videoName,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                  ),
                  Container(
                    color: Colors.white10,
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(left: 12),
                    width: width * 0.66,
                    height: height * 0.07,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text("$buyNum 人购买"),
                          flex: 2,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 12),
                            height: height * 0.03,
                            alignment: Alignment.center,
                            child: Text(
                              "已购买",
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.green),
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
