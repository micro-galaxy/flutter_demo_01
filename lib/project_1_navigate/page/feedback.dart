import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feedback extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FeedbackState();
  }
}

class FeedbackState extends State<StatefulWidget> {
  TextEditingController controller = TextEditingController();
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("意见反馈"),
          actions: <Widget>[
            IconButton(
              color: Colors.blue,
              icon: Text(
                "提交",
                style: TextStyle(color: Colors.white,fontSize: 16),
              ),
              onPressed: (){
                print(" ==>点击用户反馈");
              },
            )
          ],
          backgroundColor: Colors.blue,
        ),
        body: Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(6),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 0,
                child: TextFormField(
                  maxLines: 10,
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          gapPadding: 12),
                      hintStyle: TextStyle(color: Colors.black, fontSize: 13.0),
                      fillColor: Colors.white70,
                      filled: true,
                      contentPadding: EdgeInsets.fromLTRB(8, 4, 4, 8),
//                  contentPadding: EdgeInsets.only(top: 0.0),
                      hintText: '填写您的宝贵意见'),
                  // onChanged: onSearchTextChanged,
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    "300字以内",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
