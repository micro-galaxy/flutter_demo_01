import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SearchPage();
  }
}

class SearchPage extends State<Search> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: TextField(
              controller: controller,
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(500.0)),
                      gapPadding: 0),
                  hintStyle: TextStyle(color: Colors.black, fontSize: 13.0),
                  fillColor: Colors.black12,
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(8, 4, 4, 8),
//                  contentPadding: EdgeInsets.only(top: 0.0),
                  hintText: '搜索商品'),
              // onChanged: onSearchTextChanged,
            ),
          ),
        ),
        new IconButton(
          icon: new Icon(Icons.search),
          color: Colors.grey,
          iconSize: 26.0,
          onPressed: () {
//            controller.clear();
            //TODO 跳转搜索页面，并传递搜索数据
          },
        ),
      ],
    );
  }
}
