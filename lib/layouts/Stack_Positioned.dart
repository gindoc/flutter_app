import 'package:flutter/material.dart';

class StackAndPositionedSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stack和Positioned"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      color: Colors.green,
                    ),
                    Container(
                      color: Colors.grey,
                      child: Text("hello, it's in center"),
                    ),
                    Positioned(
                      child: Container(
                        color: Colors.grey,
                        child: Text("left 18"),
                      ),
                      left: 18,
                    ),
                    Positioned(
                      child: Container(
                        color: Colors.grey,
                        child: Text("top 18"),
                      ),
                      top: 18,
                    ),
                    Positioned(
                      child: Container(
                        color: Colors.grey,
                        child: Text("left 18, top 18"),
                      ),
                      left: 18,
                      top: 18,
                    ),
                    Positioned(
                        child: Container(
                          color: Colors.grey,
                          child: Text("left 18, top:50, width:32"),
                        ),
                        left: 18,
                        width: 200,
                        top: 50),
                    Positioned(
                      child: Container(
                        color: Colors.grey,
                        child: Text("left 18, top:76, height: 50"),
                      ),
                      left: 18,
                      top: 76,
                      height: 50,
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Positioned(
                      child: Text("left:18"),
                      left: 18,
                    ),
                    Container(
                      color: Color(0xff0099ff),
                      child: Text(
                          "StackFit.expand, i had cover a Text(\"left:18\")"),
                    ),
                    Positioned(
                      child: Text("top:18"),
                      top: 18,
                    ),
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.red,
                  child: Stack(
                    fit: StackFit.loose,
                    children: <Widget>[
                      Positioned(
                        child: Text("left:18"),
                        left: 18,
                      ),
                      Container(
                        color: Color(0xff0099ff),
                        child: Text(
                            "StackFit.loose, i had cover a Text(\"left:18\")"),
                      ),
                      Positioned(
                        child: Text("top:18"),
                        top: 18,
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 5,
            ),
            Expanded(
                flex: 1,
                child: Stack(
                  fit: StackFit.passthrough,
                  children: <Widget>[
                    Positioned(
                      child: Text("left:18"),
                      left: 18,
                    ),
                    Container(
                      color: Color(0xff0099ff),
                      child: Text(
                          "StackFit.passthrough, i had cover a Text(\"left:18\")"),
                    ),
                    Positioned(
                      child: Text("top:18"),
                      top: 18,
                    ),
                  ],
                )),
          ],
        ));
  }
}
