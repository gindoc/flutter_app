import 'package:flutter/material.dart';

class ConstrainedBoxSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Text(
          "ConstrainedBox:minHeight:50, 里面包含一个Container:height:5, 最后显示的高为50"),
    );
    var border = Border.all(color: Colors.yellow, width: 6);
    return Scaffold(
        appBar: AppBar(
          title: Text("ConstrainedBox"),
          actions: <Widget>[
            SizedBox(
              width: 20,
              height: 20,
              child: Container(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(Colors.white70),
                ),
                margin: EdgeInsets.only(right: 10),
              ),
            ),
            UnconstrainedBox(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(Colors.white70),
                ),
              ),
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: 50, minWidth: double.infinity),
                  child: Container(
                    height: 5,
                    child: redBox,
                  ),
                ),
                // ---------------------------------------
                SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(200, 60)),
                  child: Container(
                    color: Colors.green,
                    child: Text("BoxConstraints.tight(Size(200, 60)"),
                  ),
                ),
                // ---------------------------------------

                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: Container(
                    color: Colors.yellow,
                    child: Text("SizeBox width:300, height:50"),
                  ),
                ),
                // ---------------------------------------

                SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 300, height: 50),
                  child: Container(
                    color: Colors.yellow,
                    child:
                        Text("BoxConstraints.tightFor(width: 300, height: 50)"),
                  ),
                ),
                // ---------------------------------------

                SizedBox(
                  height: 10,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(border: border),
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: <Widget>[
                        Text("外层BoxConstraints(minWidth: 60, minHeight: 60),\n"
                            "内层BoxConstraints(minWidth: 90, minHeight: 20),\n"
                            "最终展示效果(minWidth: 90, minHeight: 60),\n"
                            "结论:父容器有约束最小宽/高，子容器有约束最小宽/高，则最后展示的是父容器和子容器最小宽/高中，最大的最小宽/高"),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(minWidth: 60, minHeight: 60),
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints(minWidth: 90, minHeight: 20),
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ---------------------------------------

                SizedBox(
                  height: 10,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(border: border),
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: <Widget>[
                        Text("BoxConstraints(maxWidth: 60, maxHeight: 60),\n"
                            "内层BoxConstraints(minWidth: 90,minHeight: 20,maxWidth: 120,maxHeight: 50),\n"
                            "最终展示效果(minWidth: 60, minHeight: 20),\n"
                            "结论:父容器有最大宽/高,子容器的最大宽高不起作用，子容器的范围不能超过父容器的最大宽高"),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: 60, maxHeight: 60),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minWidth: 90,
                                minHeight: 20,
                                maxWidth: 120,
                                maxHeight: 50),
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.red),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: 60, maxHeight: 60),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minWidth: 90,
                                minHeight: 20,
                                maxWidth: 120,
                                maxHeight: 50),
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.red),
                              child: Text(
                                "结论:父容器有最大宽/高,子容...",
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ---------------------------------------

                SizedBox(
                  height: 10,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(border: border),
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: <Widget>[
                        Text("BoxConstraints(minWidth: 60, minHeight: 60),\n"
                            "内层BoxConstraints(minWidth: 90,minHeight: 20,maxWidth: 120,maxHeight: 120),\n"
                            "最终展示效果(minWidth: 90, minHeight: 60),\n"
                            "结论:父容器有最大宽/高,子容器的最大宽高不起作用，子容器的范围不能超过父容器的最大宽高"),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(minWidth: 60, minHeight: 60),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minWidth: 90,
                                minHeight: 20,
                                maxWidth: 120,
                                maxHeight: 120),
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ---------------------------------------

                SizedBox(
                  height: 10,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow, width: 6),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: <Widget>[
                        Text("UnconstrainedBox示例："),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(minWidth: 60, minHeight: 60),
                          child: UnconstrainedBox(
                              child: ConstrainedBox(
                            constraints:
                                BoxConstraints(minWidth: 120, minHeight: 20),
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.red),
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
