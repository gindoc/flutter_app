import 'package:flutter/material.dart';

class PointerSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pointer(原始指针事件)"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          FlatButton(
              onPressed: () =>
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => _PointerSample1())),
              child: Text("简单示例")),
          FlatButton(
              onPressed: () =>
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => BehaviorSample())),
              child: Text("behavior示例")),
          FlatButton(
              onPressed: () =>
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => IgnorePointerEventSample())),
              child: Text("忽略PointerEvent示例")),
        ],
      ),
    );
  }
}

class _PointerSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PointerSampleState();
  }
}

class _PointerSampleState extends State<_PointerSample1> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pointer(原始指针事件)"),
      ),
      body: Listener(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          color: Colors.teal,
          alignment: Alignment.center,
          child: Text(
            _getTextFromEvent(_event),
            style: TextStyle(color: Colors.white),
          ),
        ),
        onPointerDown: (event) => setState(() => _event = event),
        onPointerMove: (event) => setState(() => _event = event),
        onPointerUp: (event) => setState(() => _event = event),
      ),
    );
  }

  String _getTextFromEvent(PointerEvent event) {
    String result;
    if (event == null) {
      result = "请触摸屏幕";
    } else {
      result = "position:  ${event.position}\n\n"
          "delta,两次指针移动事件（PointerMoveEvent）的距离: ${event.delta}\n\n"
          "pressure,按压力度，如果手机屏幕支持压力传感器(如iPhone的3D Touch)，此属性会更有意义，如果手机不支持，则始终为1:  ${event
          .pressure}\n\n"
          "orientation,指针移动方向，是一个角度值: ${event.orientation}\n\n";
    }
    return result;
  }
}

/// 无用示例
class BehaviorSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listener#Behavior示例")),
      body: Stack(
        children: <Widget>[
          Listener(
            child: Container(
              decoration: BoxDecoration(color: Colors.red),
              padding: EdgeInsets.all(30),
              constraints: BoxConstraints.tight(Size(300, 200)),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.teal),
                child: Center(
                  child: Text("Box"),
                ),
              ),
            ),
            onPointerDown: (event) => print("down 0"),
//              behavior: HitTestBehavior.opaque,
          ),
          Listener(
            child: Container(
              decoration: BoxDecoration(color: Colors.green),
              constraints: BoxConstraints.tight(Size(200.0, 90.0)),
              child: Center(child: Text("左上角200*100范围内非文本区域点击")),
            ),
            onPointerDown: (event) => print("down 1"),
            behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
          ),
        ],
      ),
    );
  }
}

class IgnorePointerEventSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("忽略PointerEvent")),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            child: Listener(
              child: AbsorbPointer(
                child: Listener(
                  child: Container(
                    color: Colors.red,
                    width: 200,
                    height: 100,
                    child: Text("AbsorbPointer"),
                  ),
                  onPointerDown: (event) => print("in"),
                ),
              ),
              onPointerDown: (event) => print("up"),
            ),
          ),
          Expanded(
            child: Listener(
              child: IgnorePointer(
                child: Listener(
                  child: Container(
                    color: Colors.green,
                    width: 200,
                    height: 100,
                    child: Text("IgnorePointer"),
                  ),
                  onPointerDown: (event) => print("in"),
                ),
              ),
              onPointerDown: (event) => print("up"),
            ),
          )
        ],
      ),
    );
  }
}
