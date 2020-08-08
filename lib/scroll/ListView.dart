import 'dart:async';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListViewSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ListView固定数量和嵌套",
          textScaleFactor: 0.69,
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListViewSample2();
                })),
            child: Text("next"),
            textColor: Colors.white,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "ListView#shrinkWrap在没有边界的容器中是要设置为true(比如ListView嵌套的时候)",
              style: TextStyle(color: Colors.red),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "ListView#physics代表滚动的View如何响应用户的输入，默认是适应平台滚动习惯(上下左右滚动)。在ListView嵌套时设置为NeverScrollableScrollPhysics()，不响应滚动，避免滑动冲突",
              style: TextStyle(color: Colors.green),
            ),
          ),
          Text(
            "ListView嵌套ListView",
            style: TextStyle(color: Colors.red, fontSize: 36),
          ),
          Text(
            "ListView嵌套ListView",
            style: TextStyle(color: Colors.red, fontSize: 36),
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              const Text(
                '这里是内部ListView',
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
              const Text('I\'m dedicating every day to you'),
              const Text('Domestic life was never quite my style'),
              const Text('When you smile, you knock me out, I fall apart'),
              const Text('And I thought I was so smart'),
              const Text('I\'m dedicating every day to you'),
              const Text('Domestic life was never quite my style'),
              const Text('When you smile, you knock me out, I fall apart'),
              const Text('And I thought I was so smart'),
            ],
          ),
          Text(
            "ListView嵌套ListView",
            style: TextStyle(color: Colors.red, fontSize: 36),
          ),
          Text(
            "ListView嵌套ListView",
            style: TextStyle(color: Colors.red, fontSize: 36),
          ),
          Text(
            "ListView嵌套ListView",
            style: TextStyle(color: Colors.red, fontSize: 36),
          ),
          Text(
            "ListView嵌套ListView",
            style: TextStyle(color: Colors.red, fontSize: 36),
          ),
          Text(
            "ListView嵌套ListView",
            style: TextStyle(color: Colors.red, fontSize: 36),
          ),
          Text(
            "ListView嵌套ListView",
            style: TextStyle(color: Colors.red, fontSize: 36),
          ),
          Text(
            "ListView嵌套ListView",
            style: TextStyle(color: Colors.red, fontSize: 36),
          ),
          Text(
            "ListView嵌套ListView",
            style: TextStyle(color: Colors.red, fontSize: 36),
          ),
          Text(
            "ListView嵌套ListView",
            style: TextStyle(color: Colors.red, fontSize: 36),
          ),
          Text(
            "ListView嵌套ListView",
            style: TextStyle(color: Colors.red, fontSize: 36),
          ),
          Text(
            "ListView嵌套ListView",
            style: TextStyle(color: Colors.red, fontSize: 36),
          ),
          Text(
            "ListView嵌套ListView",
            style: TextStyle(color: Colors.red, fontSize: 36),
          ),
          Text(
            "ListView嵌套ListView",
            style: TextStyle(color: Colors.red, fontSize: 36),
          ),
        ],
      ),
    );
  }
}

class ListViewSample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ListView不限数量(itemCount为null时为无限列表)",
          style: TextStyle(fontSize: 12),
        ),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            child: Text("next"),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListViewSample3();
                })),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("$index"),
          );
        },
        itemCount: null,
        itemExtent: 50,
      ),
    );
  }
}

class ListViewSample3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final divider1 = Divider(
      color: Colors.blue,
    );
    final divider2 = Divider(
      color: Colors.green,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("ListView(带分割线)"),
        actions: <Widget>[
          FlatButton(
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListViewSample4();
                })),
            child: Text("实战"),
            textColor: Colors.white,
          )
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: Text("$index"),
              ),
          separatorBuilder: (context, index) =>
              index % 2 == 0 ? divider1 : divider2,
          itemCount: 50),
    );
  }
}

class ListViewSample4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView实战"),
        ),
        body: InfiniteListView());
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewSample4State();
  }
}

class _ListViewSample4State extends State<InfiniteListView> {
  static const _loadingWorld = "###loading###";
  final _words = [_loadingWorld];

  final divider = Divider(
    height: 10,
    indent: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("列表标题"),
        ),
        Divider(
          height: 0,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) {
              if (_words[index] == _loadingWorld) {
                if (_words.length < 100) {
                  _receiveData();
                  return Container(
                    padding: EdgeInsets.all(16),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                    alignment: Alignment.center,
                  );
                } else {
                  return Container(
//                color: Colors.grey,
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "没有更多了",
                      style: TextStyle(color: Colors.grey),
                    ),
                    alignment: Alignment.center,
                  );
                }
              }

              return Container(
                child: Text("${_words[index]}"),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
              );
            },
            separatorBuilder: (_, __) => divider,
            itemCount: _words.length,
          ),
        )
      ],
    );
  }

  void _receiveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asCamelCase).toList());
      setState(() {});
    });
  }
}
