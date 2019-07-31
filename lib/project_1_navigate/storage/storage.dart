import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  //获取本地文件
  static Future<File> getLocalFile(String fileName) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/$fileName');
  }

  //shared_preferences插件key-value存储方式
  static Future<SharedPreferences> getStorageInstance() async {
    return await SharedPreferences.getInstance();
  }
}
