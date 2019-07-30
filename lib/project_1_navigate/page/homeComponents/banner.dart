import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MyBanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyBannerState();
  }
}

class MyBannerState extends State<MyBanner> {
  @override
  Widget build(BuildContext context) {
//return new Text("123");
    return new Container(
      // ignore: new_with_undefined_constructor_default
      padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
      //屏幕宽度
      width: MediaQuery.of(context).size.width,
      //1.8是banner宽高比，0.8是viewportFraction的值
      height: MediaQuery.of(context).size.width / 1.8,
      child: Swiper(
        itemCount: 3,
        //item数量
        itemBuilder: _getBanner,
        autoplay: true,
        //是否自动播放
        autoplayDelay: 3000,
        //自动播放延迟
        autoplayDisableOnInteraction: true,
        //触发时是否停止播放

        duration: 600,
        //动画时间

        control: new SwiperControl(size: 0),
        //默认分页按钮

        //默认指示器
        pagination: new SwiperPagination(
          // SwiperPagination.fraction 数字1/5，默认点
          builder: new DotSwiperPaginationBuilder(size: 0, activeSize: 0),
        ),

        viewportFraction: 0.8,
        //视图宽度，即显示的item的宽度屏占比
        scale: 0.9,
        loop: true,
        //两侧item的缩放比

        onTap: (int index) {
          //点击事件，返回下标
          print("index-----" + index.toString());
        },
      ),
    );
  }

  Widget _getBanner(BuildContext context, int index) {
    List<Widget> imgList = [];
    imgList.add(Container(
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://haitao.nos.netease.com/6BXWTT4KF3v2CCD1KVT1809182052_960_480.jpg"),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ));

    imgList.add(Container(
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://haitao.nos.netease.com/f3kJUUtkrDbsiU1LtopkHcBGgT1809182243_960_480.jpg"),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ));

    imgList.add(Container(
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://haitao.nosdn2.127.net/ThUbIr9WnE7TbTwTapp-kvAiT1809190053_960_480.jpg"),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ));

    return imgList[index];
  }
}
