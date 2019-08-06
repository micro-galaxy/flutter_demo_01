import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/project_1_navigate/http/http.dart';
import 'package:flutter_app_demo/project_1_navigate/utils/publicWidget.dart';

class ModifyPass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ModifyPassState();
  }
}

class ModifyPassState extends State<ModifyPass> {
  BuildContext context;

  TextEditingController _oldPassController = TextEditingController();
  TextEditingController _newPassController_0 = TextEditingController();
  TextEditingController _newPassController_1 = TextEditingController();
  FocusNode _oldPassFocusNode = FocusNode();
  FocusNode _newPassFocusNode_0 = FocusNode();
  FocusNode _newPassFocusNode_1 = FocusNode();

  bool _oldPassInputFocus = true;
  bool _newPassInputFocus_0 = false;
  bool _newPassInputFocus_1 = false;

  bool _oldViewPass = false;
  bool _newViewPass = false;

  void _modifyPass(
      TextEditingController oldPassController,
      TextEditingController newPassController_0,
      TextEditingController newPassController_1) {
    Http.post(context: null, url: null, data: null)
        .then((response) {}, onError: () {});
  }

  @override
  void initState() {
    _oldPassFocusNode.addListener(() {
      _oldPassFocusNode.hasFocus
          ? _oldPassInputFocus = true
          : _oldPassInputFocus = false;
      setState(() {
        _oldPassInputFocus = _oldPassInputFocus;
      });
    });

    _newPassFocusNode_0.addListener(() {
      _newPassFocusNode_0.hasFocus
          ? _newPassInputFocus_0 = true
          : _newPassInputFocus_0 = false;
      setState(() {
        _newPassInputFocus_0 = _newPassInputFocus_0;
      });
    });

    _newPassFocusNode_1.addListener(() {
      _newPassFocusNode_1.hasFocus
          ? _newPassInputFocus_1 = true
          : _newPassInputFocus_1 = false;
      setState(() {
        _newPassInputFocus_1 = _newPassInputFocus_1;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("修改密码"),
              backgroundColor: Colors.blue,
              elevation: 1,
            ),
            body: Builder(
                builder: (context) => SingleChildScrollView(
                      child: Container(
                          padding: EdgeInsets.only(top: 80),
                          child: Column(
                            children: <Widget>[
                              passwordWidget(
                                  _oldPassController,
                                  _oldPassFocusNode,
                                  _oldPassInputFocus,
                                  _oldViewPass, () {
                                setState(() {
                                  _oldViewPass = !_oldViewPass;
                                });
                              }),
                              passwordWidget(
                                  _newPassController_0,
                                  _newPassFocusNode_0,
                                  _newPassInputFocus_0,
                                  _newViewPass, () {
                                setState(() {
                                  _newViewPass = !_newViewPass;
                                });
                              }),
                              passwordWidget(
                                  _newPassController_1,
                                  _newPassFocusNode_1,
                                  _newPassInputFocus_1,
                                  _newViewPass, () {
                                setState(() {
                                  _newViewPass = !_newViewPass;
                                });
                              }),
                              buttonWidget("修改", () {
                                _modifyPass(_oldPassController,
                                    _newPassController_0, _newPassController_1);
                              })
                            ],
                          )),
                    ))));
  }

  //用户密码输入widget
  Widget passwordWidget(TextEditingController inputController,
      FocusNode focusNode, bool inputFocus, bool viewPass, Function callback) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 16,
            left: 20,
            right: 20,
          ),
          width: MediaQuery.of(context).size.width,
          child: TextField(
              obscureText: !viewPass,
              focusNode: focusNode,
              style: TextStyle(fontSize: 18),
              controller: inputController,
              decoration: new InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  hintText: "请输入密码",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  fillColor: Colors.white10,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.https,
                    size: 28,
                    color: inputFocus ? Colors.blue : Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    color: Colors.blue,
                    icon: Icon(
                      Icons.remove_red_eye,
                      size: 28,
                      color: viewPass ? Colors.blue : Colors.grey,
                    ),
                    onPressed: callback,
                  ))),
        ),
        PublicWidget.getLine(left: 30, right: 30),
      ],
    );
  }

  //登录按钮widget
  buttonWidget(String buttonName, Function callback) {
    return Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          color: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          child: Text(
            buttonName,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: callback,
        ));
  }

  @override
  void dispose() {
    _oldPassController.dispose();
    _newPassController_0.dispose();
    _newPassController_1.dispose();
    _oldPassFocusNode.dispose();
    _newPassFocusNode_0.dispose();
    _newPassFocusNode_1.dispose();
    super.dispose();
  }
}
