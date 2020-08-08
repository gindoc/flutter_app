import 'package:flutter/material.dart';

import 'event/PointerSample.dart';

class EventHandlingWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件处理与通知"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PointerSample())),
              child: Text("原始指针事件处理"),
              textColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
