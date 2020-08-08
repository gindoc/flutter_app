import 'package:flutter/material.dart';

class FlexAndExpandedSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flex和Expanded"),
        ),
        body: Column(children: <Widget>[
          Text("利用Flex和Expanded水平划分"),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.red,
                  )),
              Expanded(
                child: Container(
                  height: 40,
                  color: Colors.black54,
                ),
                flex: 2,
              )
            ],
          ),
          Text("利用Flex和Expanded水平划分"),
          Padding(
            padding: EdgeInsets.all(12),
            child: SizedBox(
              height: 200,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.red,
                    ),
                    flex: 2,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(color: Colors.red),
                    flex: 1,
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
