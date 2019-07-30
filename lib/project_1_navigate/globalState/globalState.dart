import 'package:flutter/cupertino.dart';

class SharedInherited extends InheritedWidget {
  SharedInherited({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final SharedInheritedWidgetState data; //通过一个StatefulWidgetState来保存数据

  @override
  bool updateShouldNotify(SharedInherited oldWidget) {
    //数据更新
    return data != oldWidget.data;
  }
}

class SharedInheritedWidget extends StatefulWidget {
  SharedInheritedWidget({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  SharedInheritedWidgetState createState() => new SharedInheritedWidgetState();

  static SharedInheritedWidgetState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(SharedInherited)
            as SharedInherited)
        .data;
  }
}

class SharedInheritedWidgetState extends State<SharedInheritedWidget> {
  String sharedVal = ''; //共享变量

  void setSharedVal(String newVal) {
    setState(() {
      sharedVal = newVal;
    });
  }

  String getSharedVal() {
    return sharedVal;
  }

  @override
  Widget build(BuildContext context) {
    return SharedInherited(child: widget.child, data: this);
  }
}
