import 'package:flutter/material.dart';

class ButtonSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button示例"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(onPressed: () {}, child: Text("FlatButton")),
          RaisedButton(
            onPressed: () {},
            child: Text("RaisedButton"),
          ),
          OutlineButton(
            onPressed: () {},
            child: Text("OutLineButton"),
          ),
          IconButton(icon: Icon(Icons.thumb_up), onPressed: () {}),
          FlatButton(
            onPressed: () {},
            child: Text("自定义FlatButton外形"),
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("自定义RaisedButton外形"),
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 5,
            highlightElevation: 10,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
