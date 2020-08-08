import 'package:flutter/material.dart';

// 状态管理

class StateManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget divider = Divider(
      color: Colors.black,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("状态管理"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          FlatButton(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Text("自己管理状态", style: TextStyle(fontSize: 22)),
            ),
            textColor: Colors.red,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return TapBoxA();
              }));
            },
          ),
          FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ParentWidgetB();
                }));
              },
              child: Padding(
                padding: EdgeInsets.all(22),
                child: Text(
                  "父布局管理状态",
                  style: TextStyle(fontSize: 22, color: Colors.red),
                ),
              )),
          FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ParentWidgetC();
                }));
              },
              child: Padding(
                padding: EdgeInsets.all(22),
                child: Text(
                  "父布局和子控件一起管理状态",
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              ))
        ],
      ),
    );
  }
}

/// 1、自己管理状态
class TapBoxA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TapBoxAState();
  }
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: handleTap,
      child: new Container(
        child: new Center(
            child: new Text(
          _active ? 'Active by self' : 'InActive by self',
          style: new TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              decoration: TextDecoration.none),
        )),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}

// 2、父容器管理状态
class ParentWidgetB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ParentWidgetBState();
  }
}

class _ParentWidgetBState extends State<ParentWidgetB> {
  bool active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapBoxB(
      active: active,
//      onChanged: (newValue){                    // 方式1
//        setState(() {
//          active = newValue;
//        });
//      },
      onChanged: _handleTapboxChanged, // 方式2
    );
  }
}

class TapBoxB extends StatelessWidget {
  final bool active;

  final ValueChanged<bool> onChanged;

  TapBoxB({Key key, this.active, @required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!active);
      },
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active by parent' : 'InActive by parent',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}

// 3、父容器和子控件一起管理状态
class ParentWidgetC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ParentWidgetCState();
  }
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return TapBoxC(
      active: active,
      onChanged: (newValue) {
        setState(() {
          active = newValue;
        });
      },
    );
  }
}

class TapBoxC extends StatefulWidget {
  final bool active;

  final ValueChanged<bool> onChanged;

  TapBoxC({Key key, this.active, @required this.onChanged});

  @override
  State<StatefulWidget> createState() {
    return _TapBoxCState();
  }
}

class _TapBoxCState extends State<TapBoxC> {
  bool _highlight = false;

  void handleTap() {
    widget.onChanged(!widget.active);
  }

  void handleTapDown(TapDownDetails detail) {
    setState(() {
      _highlight = true;
    });
  }

  void handleTapUp(TapUpDetails detail) {
    setState(() {
      _highlight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text(
            widget.active
                ? 'Active by parent, but highlight handled by self'
                : 'InActive by parent, but highlight handled by self',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight
                ? Border.all(color: Colors.teal[700], width: 10)
                : null),
      ),
      onTap: handleTap,
      onTapDown: handleTapDown,
      onTapUp: handleTapUp,
    );
  }
}
