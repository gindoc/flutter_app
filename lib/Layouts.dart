import 'package:flutter/material.dart';
import 'package:flutter_app/layouts/Column.dart';
import 'package:flutter_app/layouts/Flex_Expanded.dart';
import 'package:flutter_app/layouts/Flow.dart';
import 'package:flutter_app/layouts/Row.dart';
import 'package:flutter_app/layouts/Stack_Positioned.dart';
import 'package:flutter_app/layouts/Wrap.dart';

class Layouts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局类示例"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          FlatButton(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RowSample();
                  })),
              child: Text(
                "Row",
                style: TextStyle(color: Colors.red, fontSize: 22),
              )),
          FlatButton(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ColumnSample();
                  })),
              child: Text(
                "Column",
                style: TextStyle(color: Colors.blueAccent, fontSize: 22),
              )),
          FlatButton(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FlexAndExpandedSample();
                  })),
              child: Text(
                "Flex",
                style: TextStyle(color: Colors.black54, fontSize: 22),
              )),
          FlatButton(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WrapSample();
                  })),
              child: Text(
                "Wrap",
                style: TextStyle(color: Colors.deepOrange, fontSize: 22),
              )),
          FlatButton(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FlowSample();
                  })),
              child: Text(
                "Flow",
                style: TextStyle(color: Colors.green, fontSize: 22),
              )),
          FlatButton(
              onPressed: ()=>
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return StackAndPositionedSample();
              })),
              child: Text(
                "Stack,Positioned",
                style: TextStyle(color: Colors.purpleAccent, fontSize: 22),
              )),

        ],
      ),
    );
  }
}
