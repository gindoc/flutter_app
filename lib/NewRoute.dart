import 'package:flutter/material.dart';

//void main()=>runApp(new NewRoute());

/// 路由示例

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("New Route"),
      ),
      body: Center(
        child: Text("This is a new route"),
      ),
    );
  }

}