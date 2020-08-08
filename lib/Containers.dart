import 'package:flutter/material.dart';
import 'package:flutter_app/containers/Constrained_SizedBox.dart';
import 'package:flutter_app/containers/Container.dart';
import 'package:flutter_app/containers/DecoratedBox.dart';
import 'package:flutter_app/containers/Padding.dart';
import 'package:flutter_app/containers/Transform.dart';

import 'containers/Scaffold.dart';

class Containers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("容器类示例"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          FlatButton(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PaddingSample();
                  })),
              child: Text(
                "Padding",
                style: TextStyle(color: Colors.green[300]),
              )),
          FlatButton(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ConstrainedBoxSample();
                  })),
              child: Text(
                "ConstrainedBox/SizeBox",
                style: TextStyle(color: Colors.green[300]),
              )),
          FlatButton(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DecoratedBoxSample();
                  })),
              child: Text(
                "DecoratedBox",
                style: TextStyle(color: Colors.green[300]),
              )),
          FlatButton(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TransformSample();
                  })),
              child: Text(
                "Transform",
                style: TextStyle(color: Colors.green[300]),
              )),
          FlatButton(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ContainerSample();
                  })),
              child: Text(
                "Container容器",
                style: TextStyle(color: Colors.green[300]),
              )),
          FlatButton(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScaffoldSample();
                  })),
              child: Text(
                "Scaffold/TabBar/TabBarView",
                style: TextStyle(color: Colors.green[300]),
              )),
        ],
      ),
    );
  }
}
