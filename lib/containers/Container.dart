import 'package:flutter/material.dart';
import 'dart:math' as math;

class ContainerSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Container"),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("RadialGradient中的radius是这样取值的："
                    "圆心的位置为0，Math.min(width, height)的位置为1"
                    "简单的示例如下(矩形的宽高都是150,RadialGradient圆心在矩形中间，则radius=0.5时，刚好颜色从矩形中心到矩形边缘渐变完)"),
                Container(
                  constraints: BoxConstraints.tightFor(width: 150, height: 150),
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                          colors: [Colors.white, Colors.black],
                          center: Alignment.center,
                          radius: 0.5)),
                  alignment: Alignment.center,
                  child: Text(
                    "5.20",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("RadialGradient#radius=0.5, center=Alignment.center"),
                Container(
                  constraints: BoxConstraints.tightFor(width: 200, height: 150),
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                        colors: [Colors.white, Colors.black],
                        center: Alignment.center,
                        radius: 0.5),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("RadialGradient#radius=0.5, center=Alignment.topLeft"),
                Container(
                  constraints: BoxConstraints.tightFor(width: 200, height: 150),
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                          colors: [Colors.white, Colors.black],
                          center: Alignment.topLeft,
                          radius: 0.5)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("RadialGradient#radius=1, center=Alignment.topLeft"),
                Container(
                  constraints: BoxConstraints.tightFor(width: 200, height: 150),
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                          colors: [Colors.white, Colors.black],
                          center: Alignment.topLeft,
                          radius: 1)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("RadialGradient#radius=1.5, center=Alignment.topLeft"),
                Container(
                  constraints: BoxConstraints.tightFor(width: 200, height: 150),
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                          colors: [Colors.white, Colors.black],
                          center: Alignment.topLeft,
                          radius: 1.5)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 150),
                  child: Text(
                    "5.20",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                          colors: [Colors.red, Colors.orange],
                          center: Alignment.center,
                          radius: 0.98),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(5, 5),
                            color: Colors.black54,
                            blurRadius: 4)
                      ]),
                  alignment: Alignment.center,
                  constraints: BoxConstraints.tightFor(width: 150, height: 100),
                  transform: Matrix4.rotationZ(math.pi / 6),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  color: Colors.red,
                  child: Text("margin=20"),
                ),
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(20),
                  child: Text("padding=20"),
                )
              ],
            ),
          ],
        ));
  }
}
