import 'package:flutter/material.dart';

class RowSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "TextDirection.rtl  :",
            style: TextStyle(color: Colors.red),
          ),
          Container(
            color: Colors.red,
            child: Row(
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text("child 1"),
                Text("child 2"),
              ],
            ),
          ),
          Text("MainAxisAlignment.center"),
          Container(
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text("child 1"),
                Text("child 2"),
              ],
            ),
          ),
          Text("TextDirection.rtl，MainAxisAlignment.end"),
          Container(
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text("child 1"),
                Text("child 2"),
              ],
            ),
          ),
          Text(
            "MainAxisAlignment.center,MainAxisSize.min:",
            style: TextStyle(color: Colors.red),
          ),
          Container(
            color: Colors.red,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("child 1"),
                Text("child 2"),
              ],
            ),
          ),
          Text(
            "VerticalDirection.down,CrossAxisAlignment.start:",
            style: TextStyle(color: Colors.red),
          ),
          Container(
            color: Colors.red,
//            height: 100,
            child: Row(
              verticalDirection: VerticalDirection.down,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "child 1",
                  style: TextStyle(fontSize: 60),
                ),
                Text("child 2"),
              ],
            ),
          ),
          Text(
            "VerticalDirection.up,CrossAxisAlignment.start:",
            style: TextStyle(color: Colors.red),
          ),
          Container(
            color: Colors.red,
//            height: 100,
            child: Row(
              verticalDirection: VerticalDirection.up,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "child 1",
                  style: TextStyle(fontSize: 60),
                ),
                Text("child 2"),
              ],
            ),
          ),
          Text("Row嵌套Row,不做处理时，里面的Row宽度只能适应内容宽度"),
          Container(
            color: Colors.green,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text("child 1"),
                        Text("child 2"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Text("Row嵌套Row,里面的Row用Expanded包裹，达到宽度max的效果"),
          Container(
            color: Colors.green,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                      child: Container(
                    color: Colors.red,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text("child 1"),
                        Text("child 2"),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
