import 'package:flutter/material.dart';

class ColumnSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Column"),
        ),
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "MainAxisAlignment.start",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text("child 1"),
                    Text("child 222222"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "MainAxisAlignment.center",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text("child 1"),
                    Text("child 222222"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "MainAxisAlignment.end",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text("child 1"),
                    Text("child 222222"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "MainAxisAlignment.spaceAround",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text("child 1"),
                    Text("child 222222"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "MainAxisAlignment.spaceEvenly",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text("child 1"),
                    Text("child 222222"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "MainAxisAlignment.spaceBetween",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text("child 1"),
                    Text("child 222222"),
                  ],
                ),
              ),
            ),
            UnconstrainedBox(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "MainAxisSize.min, MainAxisAlignment.center",
                        style: TextStyle(color: Colors.black54),
                      ),
                      Text("child 1"),
                      Text("child 222222"),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    Text(
                      "MainAxisAlignment.end,VerticalDirection.up",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text("child 1"),
                    Text("child 222222"),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "MainAxisAlignment.start,CrossAxisAlignment.end",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text("child 1"),
                    Text("child 222222"),
                  ],
                ),
              ),
            ),
          ],
        )
//      Row(
//        mainAxisAlignment: MainAxisAlignment.start,
//        children: <Widget>[
//
//        ],
//      ),
        );
  }
}
