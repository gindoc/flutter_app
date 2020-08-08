import 'package:flutter/material.dart';

class FlowSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flow"),
      ),
      body: Container(
        color: Colors.grey,
        child: Flow(
          delegate: CustomFlowDelegate(
            EdgeInsets.all(10),
          ),
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.red,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.green,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.blue,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.yellow,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.brown,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.purple,
            ),
//            Container(
//
//            )
            Text("Flow的使用需要自定义FlowDelegate，重写paintChildren()和shouldRepaint()方法")
          ],
        ),
      ),
    );
  }
}

class CustomFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  CustomFlowDelegate(this.margin);

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; ++i) {
      final childSize = context.getChildSize(i);
      if (x + childSize.width + margin.right <= context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x += childSize.width + margin.right / 2;
      } else {
        x = margin.left;
        if (i > 0) {
          y += context.getChildSize(i - 1).height + margin.bottom / 2;
        } else {
          y += childSize.height;
        }
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x += childSize.width + margin.right / 2;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 400);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
