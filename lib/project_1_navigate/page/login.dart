import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/project_1_navigate/http/http.dart';
import 'package:flutter_app_demo/project_1_navigate/router/router.dart';
import 'package:flutter_app_demo/project_1_navigate/utils/publicWidget.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  BuildContext context;

  //控制显示登录注册页面
  bool _loginPage = true;
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _captchaController = TextEditingController();
  FocusNode _userIdFocusNode = FocusNode();
  FocusNode _passFocusNode = FocusNode();
  FocusNode _captchaFocusNode = FocusNode();

  bool _userIdInputFocus = false;
  bool _passInputFocus = false;
  bool _captchaInputFocus = false;
  bool _viewPass = false;

  //验证码计时器
  Timer _timer;
  int _countdownTime = 0;

  //登录function
  _login(TextEditingController userId, TextEditingController pass) {
    Http.networkOk(context).then((ok) {
      if (!ok) {
        PublicWidget.showSnackBar(
            context: context,
            text: "网络异常，请检查网络",
            textColor: Colors.white,
            backgroundColor: Colors.red);
      } else {
        //处理登录逻辑
        Navigator.of(context).pushNamedAndRemoveUntil(
            Router.getRouterPathByName("AppNavigate"),
                (route) => route == null);
      }
    });
  }

  //注册function
  _registered(TextEditingController _userIdController,
      TextEditingController _passwordController,
      TextEditingController _captchaController) {
    //处理登录逻辑
    Navigator.of(context).pushNamedAndRemoveUntil(
        Router.getRouterPathByName("AppNavigate"), (route) => route == null);
  }

  //发送验证码function
  _sendCaptcha() {
    Http.post(context: context, url: "http://baidudwadaw.com/", data: null)
        .then((response) {
      PublicWidget.showSnackBar(
          context: context,
          text: "验证码已发送，请注意查收",
          textColor: Colors.white,
          backgroundColor: Colors.green);
      if (_countdownTime == 0) {
        setState(() {
          _countdownTime = 60;
        });
        //开始倒计时
        _startCountdownTimer();
      }
    });
  }

  //验证码计时器
  _startCountdownTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdownTime < 1) {
          _timer.cancel();
        } else {
          _countdownTime = _countdownTime - 1;
        }
      });
    });
  }

  @override
  void initState() {
    _userIdFocusNode.addListener(() {
      _userIdFocusNode.hasFocus
          ? _userIdInputFocus = true
          : _userIdInputFocus = false;
      setState(() {
        _userIdInputFocus = _userIdInputFocus;
      });
    });

    _passFocusNode.addListener(() {
      _passFocusNode.hasFocus
          ? _passInputFocus = true
          : _passInputFocus = false;
      setState(() {
        _passInputFocus = _passInputFocus;
      });
    });

    _captchaFocusNode.addListener(() {
      _captchaFocusNode.hasFocus
          ? _captchaInputFocus = true
          : _captchaInputFocus = false;
      setState(() {
        _captchaInputFocus = _captchaInputFocus;
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
          title: Text(
            "登录",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
        body: Builder(
            builder: (context) {
              this.context = context;
              return SingleChildScrollView(
                  child: Container(
                    height: 600,
                    child: Column(
                      children: <Widget>[
                        iconWidget(context),
                        Expanded(
                          child: _loginPage ? loginWidget() : registered(
                              context),
                        ),
                      ],
                    ),
                  ));
            }),
      ),
    );
  }

  //icon和文字
  Widget iconWidget(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: EdgeInsets.only(top: 60),
      child: Column(
        children: <Widget>[
          //图标
          Container(
            alignment: Alignment.topCenter,
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/logo.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
          ),
          //文字
          Container(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              "欢迎来到检测网校",
              style: TextStyle(fontSize: 22, color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }

  //登录页面
  Widget loginWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          userIdWidget(),
          passwordWidget(),
          loginButtonWidget("登录", () {
            _login(_userIdController, _passwordController);
          }),
          registeredButton("立即注册", (TapUpDetails details) {
            setState(() {
              _loginPage = !_loginPage;
            });
          })
        ],
      ),
    );
  }

  //注册页面
  Widget registered(BuildContext context) {
    this.context = context;
    return Container(
      child: Column(
        children: <Widget>[
          userIdWidget(),
          passwordWidget(),
          captchaWidget(() {
            _sendCaptcha();
          }),
          loginButtonWidget("立即注册", () {
            _registered(
                _userIdController, _passwordController, _captchaController);
          }),
          registeredButton("登录", (TapUpDetails details) {
            setState(() {
              _loginPage = !_loginPage;
            });
          })
        ],
      ),
    );
  }

  //用户id输入widget
  Widget userIdWidget() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 50,
            left: 20,
            right: 20,
          ),
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: TextField(
              autofocus: true,
              focusNode: _userIdFocusNode,
              style: TextStyle(fontSize: 18),
              controller: _userIdController,
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.all(0),
                hintText: "请输入用户名",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(borderSide: BorderSide.none),
                fillColor: Colors.white10,
                filled: true,
                prefixIcon: Icon(
                  Icons.person,
                  size: 32,
                  color: _userIdInputFocus ? Colors.blue : Colors.grey,
                ),
              )
            // onChanged: onSearchTextChanged,
          ),
        ),
        PublicWidget.getLine(left: 30, right: 30),
      ],
    );
  }

  //用户密码输入widget
  Widget passwordWidget() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 16,
            left: 20,
            right: 20,
          ),
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: TextField(
              obscureText: !_viewPass,
              focusNode: _passFocusNode,
              style: TextStyle(fontSize: 18),
              controller: _passwordController,
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
                    color: _passInputFocus ? Colors.blue : Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    color: Colors.blue,
                    icon: Icon(
                      Icons.remove_red_eye,
                      size: 28,
                      color: _viewPass ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _viewPass = !_viewPass;
                      });
                    },
                  ))),
        ),
        PublicWidget.getLine(left: 30, right: 30),
      ],
    );
  }

  //登录按钮widget
  loginButtonWidget(String buttonName, Function callback) {
    return Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        width: MediaQuery
            .of(context)
            .size
            .width,
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

  //注册按钮
  Widget registeredButton(String buttonName, Function callback) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: GestureDetector(
        onTapUp: callback,
        child: Text(
          buttonName,
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }

  //验证码输入框
  Widget captchaWidget(Function callback) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 16,
            left: 20,
            right: 20,
          ),
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: TextField(
              focusNode: _captchaFocusNode,
              style: TextStyle(fontSize: 18),
              controller: _captchaController,
              decoration: new InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  hintText: "请输入短信验证码",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  fillColor: Colors.white10,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.verified_user,
                    size: 28,
                    color: _captchaInputFocus ? Colors.blue : Colors.grey,
                  ),
                  suffixIcon: Container(
                      child: FlatButton(
                        color: Colors.white12,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        child: Text(
                          _countdownTime > 0
                              ? '$_countdownTime秒后重新获取'
                              : '获取验证码',
                          style: TextStyle(
                              color: _countdownTime > 0 ? Colors.grey : Colors
                                  .blue,
                              fontSize: 14),
                        ),
                        onPressed: _countdownTime > 0 ? null : callback,
                      )))),
        ),
        PublicWidget.getLine(left: 30, right: 30),
      ],
    );
  }

  @override
  void dispose() {
    if (_timer != null) _timer.cancel();
    _userIdController.dispose();
    _passwordController.dispose();
    _captchaController.dispose();
    _userIdFocusNode.dispose();
    _passFocusNode.dispose();
    _captchaFocusNode.dispose();
    super.dispose();
  }
}
