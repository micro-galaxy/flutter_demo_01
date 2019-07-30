import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Storage {
  //在app私有目录创建新文件
  static Future<File> getLocalFile(String fileName) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/$fileName');
  }

//cookies存储

}
