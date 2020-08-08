import 'package:flutter/material.dart';

class TextSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text示例"),
      ),
      body: DefaultTextStyle(
          style: TextStyle(color: Colors.red, fontSize: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("hello world"),
              Text("I am Jack"),
              Text(
                "I am Jack",
                style: TextStyle(color: Colors.teal[500], inherit: false),
              ),
              Text(
                "Hello world! I'm Jack. " * 4,
                textAlign: TextAlign.center,
              ),
              Text(
                "Hello world! I'm Jack. " * 4,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Hello world",
                textScaleFactor: 1.5,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(text: "Home: "),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(color: Colors.blue),
//                  recognizer:
                ),
              ]))
            ],
          )),
    );
  }
}
