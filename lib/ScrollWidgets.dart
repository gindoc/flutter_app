import 'package:flutter/material.dart';
import 'package:flutter_app/scroll/CustomScrollView.dart';
import 'package:flutter_app/scroll/GridView.dart';
import 'package:flutter_app/scroll/ScrollController.dart';
import 'package:flutter_app/scroll/SingleChildScrollView.dart';

import 'scroll/ListView.dart';

class ScrollWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollWidgets"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(vertical: 14),
        children: <Widget>[
          Column(
            children: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SingleChildScrollViewSample();
                      })),
                  child: Text(
                    "SingleChildScrollView",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  )),
              FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ListViewSample();
                    }));
                  },
                  child: Text(
                    "ListView",
                    style: TextStyle(color: Colors.yellow, fontSize: 16),
                  )),
              FlatButton(
                  onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return GridViewSample();
                      })),
                  child: Text(
                    "GridView",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  )),
              FlatButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomScrollViewSample())),
                  child: Text(
                    "CustomScrollView",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  )),
              FlatButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScrollControllerSample())),
                  child: Text(
                    "滚动监听及控制ScrollController",
                    style: TextStyle(color: Colors.purple, fontSize: 16),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
