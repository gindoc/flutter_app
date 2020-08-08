import 'package:flutter/material.dart';

class WrapSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.red,
                child: Wrap(
                  runSpacing: 10,
                  spacing: 5,
                  alignment: WrapAlignment.center,
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: <Widget>[
                    Text("direction: Axis.vertical"),
                    Text("alignment: WrapAlignment.center"),
                    Text("crossAxisAlignment: WrapCrossAlignment.end"),
                    Text("space:5(主轴间隙)"),
                    Text("runSpacing: 10 (纵轴间隙，不起作用)"),
                  ],
                ),
              )),
          SizedBox(height: 10),
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.red,
                child: Wrap(
                  spacing: 5,
                  runSpacing: 25,
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Text("direction:horizontal，"),
                    Text("alignment:center，"),
                    Text("space:5(主轴间隙)，"),
                    Text("runSpacing: 25(纵轴间隙)"),
                    Text("WrapCrossAlignment.center不起作用")
                  ],
                ),
              )),
          SizedBox(height: 10),
          Expanded(
              child: Container(
                color: Colors.red,
                child: Wrap(
                  direction: Axis.horizontal,
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Text("direction: Axis.horizontal"),
                    Text("TextDirection.rtl,"),
                    Text("text1,"),
                    Text("text2,"),
                  ],
                ),
              )),
          SizedBox(height: 10),
          Expanded(
            flex: 2,
              child: Container(
                color: Colors.red,
                child: Wrap(
                  direction: Axis.vertical,
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Text("direction: Axis.vertical,"),
                    Text("TextDirection.rtl,"),
                    Text("text1,"),
                    Text("text2,"),
                  ],
                ),
              )),
          SizedBox(height: 10),
          Expanded(
              child: Container(
            color: Colors.red,
            child: Wrap(
              direction: Axis.horizontal,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Text("direction: Axis.horizontal,"),
                Text("VerticalDirection.up,"),
                Text("text1,"),
                Text("text2,"),
              ],
            ),
          )),
          SizedBox(height: 10),
          Expanded(
            flex: 2,
              child: Container(
                color: Colors.red,
                child: Wrap(
                  direction: Axis.vertical,
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    Text("direction: Axis.vertical,"),
                    Text("direction: Axis.vertical,"),
                    Text("direction: Axis.vertical,"),
                    Text("VerticalDirection.up,"),
                    Text("text1,"),
                    Text("text2,"),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
