import 'package:flutter/cupertino.dart';

///flutter状态管理有很多：第三方库flutter_redux、自带InheritedWidget、第三方库Provider
/// 1，flutter_Redux使用起来比较复杂
/// 2，InheritedWidget原生组件，需要自己实现，复杂
/// 3，Provider是官方推荐状态管理，基于InheritedWidget原生组件的实现
///
class ProviderState with ChangeNotifier {
  //全局视频信息管理（包含下载状态、下载进度、当前播放状态）
  Map<String, Map<String, Object>> _videoInfo = Map();

  //全局下载进度测试
  double _progress = 0;

  double getProgress() => _progress;

  void setProgress(double progress) {
    _progress = progress;
    notifyListeners();
  }

  //初始化视频信息
  void initVideoInfo(List<Map<String, Object>> videoInfoList) {
    videoInfoList.forEach((v) {
      assert(v["id"] != null);
      _videoInfo.putIfAbsent(v["id"], () => v);
    });
    notifyListeners();
  }

  //设置单个视频信息
  void setVideoById(String videoId, Map<String, Object> videoInfo) {
    assert(videoId != null && videoId != "");
    assert(videoInfo != null && videoInfo.length != 0);
    bool flag = false;
    _videoInfo.forEach((k, v) {
      if (k == videoId) {
        v = videoInfo;
        flag = true;
      }
    });

    if (!flag) {
      print(" ==>视频信息修改失败，视频id不存在:$videoId");
    } else {
      notifyListeners();
    }
  }

  //获取单个视频信息
  Map<String, Object> getVideoById(String videoId) {
    assert(videoId != null && videoId != "");

    Map<String, Object> videoInfo;
    _videoInfo.forEach((k, v) {
      if (videoId == k) videoInfo = v;
    });

    return videoInfo;
  }
}
