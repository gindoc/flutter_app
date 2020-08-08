import 'package:flutter/material.dart';

class ScrollControllerSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollController示例"),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => _ScrollControllerSample2())),
              child: Text("next"))
        ],
      ),
      body: _ScrollController(),
    );
  }
}

class _ScrollController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollControllerState();
  }
}

class _ScrollControllerState extends State<_ScrollController> {
  ScrollController _controller = ScrollController(initialScrollOffset: 100);
  bool isShowFloatingBtn = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.offset < 1000 && isShowFloatingBtn) {
        setState(() {
          isShowFloatingBtn = false;
        });
      } else if (_controller.offset >= 1000 && !isShowFloatingBtn) {
        setState(() {
          isShowFloatingBtn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scrollbar(
          child: ListView.builder(
            controller: _controller,
            itemBuilder: (context, index) => Container(
                  color: Colors.green[100 * (index % 9)],
                  child: ListTile(
                    title: Text("List Item $index"),
                  ),
                ),
            itemCount: 30,
          ),
        ),
        Positioned(
          child: isShowFloatingBtn
              ? FloatingActionButton(
                  child: Icon(Icons.arrow_upward),
                  onPressed: () {
                    _controller.animateTo(0,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.decelerate);
                  },
                )
              : SizedBox(),
          bottom: 30,
          right: 25,
        )
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _ScrollControllerSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollControllerSample2State();
  }
}

class _ScrollControllerSample2State extends State<_ScrollControllerSample2> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      var pixels1 = _controller.positions.elementAt(0).pixels;
      var pixels2 = _controller.positions.elementAt(1).pixels;
      if (pixels1 > 1000) {
        _controller.positions.elementAt(0).animateTo(0,
            duration: Duration(milliseconds: 200), curve: Curves.decelerate);
      }
      if (pixels2 > 2000) {
        _controller.positions.elementAt(1).animateTo(0,
            duration: Duration(milliseconds: 1000), curve: Curves.decelerate);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "一个controller对应多个scrollable widget",
          style: TextStyle(fontSize: 10),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => _ScrollNotificationSample())),
              child: Text("next"))
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemBuilder: (context, index) => Container(
                    color: Colors.green[100 * (index % 9)],
                    child: ListTile(
                      title: Text("list item $index"),
                    ),
                  ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemBuilder: (context, index) => Container(
                    color: Colors.green[100 * (index % 9)],
                    child: ListTile(
                      title: Text("list item $index"),
                    ),
                  ),
            ),
          )
        ],
      ),
    );
  }
}

class _ScrollNotificationSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollNotificationSampleState();
  }
}

class _ScrollNotificationSampleState extends State<_ScrollNotificationSample> {
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollNotification"),
      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          child: Stack(
            children: <Widget>[
              ListView.builder(
                itemBuilder: (context, index) => Container(
                      child: Container(
                        alignment: Alignment.center,
                        child: index == 0
                            ? Text(
                                "NotificationListener#onNotification返回true时，滚动条将失效(Scrollbar就是通过监听滚动通知实现的)")
                            : Text("list item $index"),
                      ),
                      color: Colors.green[100 * (index % 9)],
                    ),
                itemCount: 100,
                itemExtent: 50,
              ),
              Positioned(
                bottom: 35,
                right: 25,
                child: CircleAvatar(
                  child: Text(
                    _progress,
                    style: TextStyle(fontSize: 12),
                  ),
                  backgroundColor: Colors.black54,
                ),
              ),
            ],
          ),
          onNotification: (n) {
            double progress = n.metrics.pixels / n.metrics.maxScrollExtent;
            if (n.metrics.atEdge) {
              print("is at edge: ${n.metrics.atEdge}");
            }

            print("pixel: ${n.metrics.pixels}     "
                "maxScrollExtent: ${n.metrics.maxScrollExtent}");

            print("extentBefore: ${n.metrics.extentBefore}   "
                "extentInside: ${n.metrics.extentInside}    "
                "extentAfter: ${n.metrics.extentAfter}");
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
//            return true;            // 放开此行注释后，进度条将失效
          },
        ),
      ),
    );
  }
}
