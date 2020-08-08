import 'package:flutter/material.dart';

class InheritedWidgetSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InheritedWidgetSampleState();
  }
}

class _InheritedWidgetSampleState extends State<InheritedWidgetSample> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ShareDataWidget(
              // 使用ShareDataWidget
              count,
              _Text(), // 子widget中依赖ShareDataWidget
            ),
            RaisedButton(
              // 每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
              onPressed: () => setState(() => ++count),
              child: Text("Increament"),
            )
          ],
        ),
      ),
    );
  }
}

class ShareDataWidget extends InheritedWidget {
  int count; // 需要在子树中共享的数据，保存点击次数

  // 该回调决定当data发生变化时，是否通知子树中依赖count的Widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // 如果返回true，则子树中依赖(build函数中有调用)本widget
    // 的子widget的`state.didChangeDependencies`会被调用
    return oldWidget.count != count;
  }

  ShareDataWidget(@required this.count, Widget child) : super(child: child);

  // 定义一个便捷方法，方便子树中的widget获取共享数据，这里的context是最近的widget(这个例子中是_Text)
  static ShareDataWidget of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(ShareDataWidget);
}

class _Text extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextState();
  }
}

class _TextState extends State<_Text> {
  @override
  Widget build(BuildContext context) {
    // 使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context).count.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencies change");
    print(
        "State#didChangeDependencies():父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。"
        "如果build中没有依赖InheritedWidget，则此回调不会被调用。");
  }
}
