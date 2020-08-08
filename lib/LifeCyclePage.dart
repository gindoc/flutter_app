import 'package:flutter/material.dart';


// 生命周期示例

class LifeCyclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("reload时会走父widget的build吗？会的");
//    return Text.dart("测试移出CounterWidget后的生命周期");
    return new CounterWidget();
  }
}

class CounterWidget extends StatefulWidget {
  final int initValue;

  const CounterWidget({Key key, this.initValue: 0});

  @override
  State<StatefulWidget> createState() {
    return new _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    //初始化状态
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Center(
        child: FlatButton(
      onPressed: () => setState(() => ++_counter),
      child: new Text(
        "$_counter",
        style: TextStyle(
            color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold),
      ),
    ));
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }
}
