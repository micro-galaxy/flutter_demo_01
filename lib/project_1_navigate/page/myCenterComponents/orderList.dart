import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderListState();
  }
}

class OrderListState extends State<OrderList> {
  BuildContext context;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text("订单列表"), elevation: 0),
      backgroundColor: Color(0xFFF6F3F3),
      body: Column(
        children: getOrderList(),
      ),
    );
  }

//  订单列表，后期使用网络请求
  List<Widget> getOrderList() {
    List<Widget> orderList = [];
    orderList.add(getOrderPage());
    return orderList;
  }

//  单个订单布局
  Widget getOrderPage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 5),
              blurRadius: 12.0,
              spreadRadius: 3.0),
        ],
        color: Colors.white,
      ),
      margin: EdgeInsets.only(top: 18, left: 8, right: 8, bottom: 8),
      padding: EdgeInsets.only(left: 18, right: 18),
      height: this.height / 6,
      width: this.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "订单时间:",
                style: TextStyle(color: Colors.black45),
              ),
              Container(
                width: this.width * 0.51,
                padding: EdgeInsets.only(left: 8),
                child: Text("2019-07-29 15:36",
                    style: TextStyle(color: Colors.black45)),
              ),
              Text(
                "已支付",
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          Container(
//            margin: EdgeInsets.only(left: 8, right: 8),
            color: Colors.grey,
            height: 0.2,
          ),
          Row(
            children: <Widget>[
              Image.asset(
                "images/order.png",
                width: 20,
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 6),
                width: this.width * 0.64,
                child: Text(
                  "检测师课程",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Text(
                "￥599",
                style: TextStyle(color: Colors.red),
              )
            ],
          )
        ],
      ),
    );
  }
}
