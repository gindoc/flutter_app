import 'package:flutter/material.dart';

import 'functions/InheritedWidgetSample.dart';
import 'functions/ThemeSample.dart';
import 'functions/WillPopScopeSample.dart';

class FunctionWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Function Widgets"),
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WillPopScopeSample())),
              child: Text("导航返回拦截-WillPopScope")),
          FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InheritedWidgetSample())),
              child: Text("数据共享-InheritedWidget")),
          FlatButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ThemeSample())),
              child: Text("主题-Theme")),
        ],
      ),
    );
  }
}
