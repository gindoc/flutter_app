import 'package:flutter/material.dart';

class PaddingSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Padding"),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 20, right: 30, bottom: 40),
            child: Container(
              color: Colors.red,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Text("padding:left: 10, top: 20, right: 30, bottom: 40")
                ],
              ),
            ),
          ),
        ));
  }
}
