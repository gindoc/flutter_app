import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/Switch_CheckBox.dart';
import 'package:flutter_app/widgets/Text.dart';
import 'package:flutter_app/widgets/Button.dart';
import 'package:flutter_app/widgets/Image.dart';
import 'package:flutter_app/widgets/TextField.dart';

class Widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget 示例"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          FlatButton(
            child: Text(
              "Text",
              style: TextStyle(color: Colors.blue, fontSize: 22),
            ),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TextSample();
                })),
          ),
          FlatButton(
            child: Text(
              "Button",
              style: TextStyle(color: Colors.teal, fontSize: 22),
            ),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ButtonSample();
                })),
          ),
          FlatButton(
            child: Text(
              "Image",
              style: TextStyle(color: Colors.lightGreen, fontSize: 22),
            ),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ImageSample();
                })),
          ),
          FlatButton(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SwitchAndCheckBoxSample();
                  })),
              child: Text(
                "Swich、CheckBox",
                style: TextStyle(fontSize: 22, color: Colors.pink),
              )),
          FlatButton(
            child: Text("TextField",style: TextStyle(color: Colors.red, fontSize: 22),),
            onPressed: ()=>
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return TextFieldSample();
            })),
          )
        ],
      ),
    );
  }
}
