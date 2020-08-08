import 'package:flutter/material.dart';
import 'dart:math';

class TransformSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Transform"),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(50),
                  child: SizedBox(
                    height: 50,
                    child: Container(
                      color: Colors.black54,
                      child: Transform(
                        alignment: Alignment.topRight,
                        transform: Matrix4.skewY(-0.3),
                        child: Container(
                          child: Text("Transform：Matrix4.skewY(0.3)"),
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(50),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Transform.translate(
                      offset: Offset(-20, -5),
                      child: Text("Transform.translate"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(50),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: Text("Transform.rotate"),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(50),
                    child: Column(
                      children: <Widget>[
                        Text("由于第一个Text应用变换(放大)后，其在绘制时会放大，"
                            "但其占用的空间依然为红色部分，所以第二个text会紧挨着红色部分，"
                            "最终就会出现文字有重合部分。"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            DecoratedBox(
                              decoration: BoxDecoration(color: Colors.red),
                              child: Transform.scale(
                                scale: 1.5,
                                child: Text("Transform.scale"),
                              ),
                            ),
                            Text("hello world")
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text(
                            "RotatedBox是作用于layout阶段，所以widget会旋转90度（而不只是绘制的内容），"
                                "decoration会作用到widget所占用的实际空间上"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            DecoratedBox(
                              decoration: BoxDecoration(color: Colors.red),
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: Text("RotatedBox"),
                              ),
                            ),
                            Text("hello world")
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ],
        ));
  }
}
