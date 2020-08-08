import 'dart:async';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';

class GridViewSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    print("width / 3.1 :${width / 3.1}");
    print("width/3 :${width / 3}");
    print("width/4 :${width / 4}");
    print("(width - 10) / 3.1 :${(width - 10) / 3.1}");
    print("(width - 10) / 3 :${(width - 10) / 3}");
    print("(width - 15) / 4 :${(width - 15) / 4}");

    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GridViewSample2())),
              child: Text("Next"))
        ],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("GridView#SliverGridDelegateWithFixedCrossAxisCount"),
          ),
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5),
            children: <Widget>[
              Container(
                color: Colors.grey,
                child: Icon(Icons.ac_unit),
              ),
              Container(
                color: Colors.red,
                child: Icon(Icons.airport_shuttle),
              ),
              Container(
                color: Colors.blue,
                child: Icon(Icons.all_inclusive),
              ),
              Container(
                color: Colors.green,
                child: Icon(Icons.beach_access),
              ),
              Container(
                color: Colors.yellow,
                child: Icon(Icons.cake),
              ),
              Container(
                color: Colors.purple,
                child: Icon(Icons.free_breakfast),
              ),
            ],
          ),
          ListTile(title: Text("GridView.count")),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            childAspectRatio: 1,
            children: <Widget>[
              Container(
                color: Colors.grey,
                child: Icon(Icons.ac_unit),
              ),
              Container(
                color: Colors.red,
                child: Icon(Icons.airport_shuttle),
              ),
              Container(
                color: Colors.blue,
                child: Icon(Icons.all_inclusive),
              ),
              Container(
                color: Colors.green,
                child: Icon(Icons.beach_access),
              ),
              Container(
                color: Colors.yellow,
                child: Icon(Icons.cake),
              ),
              Container(
                color: Colors.purple,
                child: Icon(Icons.free_breakfast),
              ),
            ],
            mainAxisSpacing: 10,
            crossAxisSpacing: 5,
          ),
          ListTile(
            title: Text("GridView.custom"),
          ),
          GridView.custom(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5),
            childrenDelegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                      color: Colors.yellow[100 + 100 * index],
                      child: Icon(Icons.free_breakfast),
                    ),
                childCount: 9),
          ),
          ListTile(
            title: Text(
                "GridView#SliverGridDelegateWithMaxCrossAxisExtent(item最大宽度不超过maxCrossAxisExtent的情况下，等分屏幕宽度)"),
          ),
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: (width - 10) / 3.1,
              crossAxisSpacing: 5,
              mainAxisSpacing: 10,
            ),
            children: <Widget>[
              Container(
                color: Colors.grey,
                child: Icon(Icons.ac_unit),
              ),
              Container(
                color: Colors.red,
                child: Icon(Icons.airport_shuttle),
              ),
              Container(
                color: Colors.blue,
                child: Icon(Icons.all_inclusive),
              ),
              Container(
                color: Colors.green,
                child: Icon(Icons.beach_access),
              ),
              Container(
                color: Colors.yellow,
                child: Icon(Icons.cake),
              ),
              Container(
                color: Colors.purple,
                child: Icon(Icons.free_breakfast),
              ),
            ],
          ),
          ListTile(
            title: Text("GridView.extent"),
          ),
          GridView.extent(
            maxCrossAxisExtent: (width - 10) / 3.1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                color: Colors.grey,
                child: Icon(Icons.ac_unit),
              ),
              Container(
                color: Colors.red,
                child: Icon(Icons.airport_shuttle),
              ),
              Container(
                color: Colors.blue,
                child: Icon(Icons.all_inclusive),
              ),
              Container(
                color: Colors.green,
                child: Icon(Icons.beach_access),
              ),
              Container(
                color: Colors.yellow,
                child: Icon(Icons.cake),
              ),
              Container(
                color: Colors.purple,
                child: Icon(Icons.free_breakfast),
              ),
            ],
          ),
          ListTile(
            title: Text("GridView.builder"),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 5),
            itemBuilder: (context, index) => Container(
                  color: Colors.purple[100 + 100 * index],
                  child: Icon(Icons.free_breakfast),
                ),
          ),
        ],
      ),
    );
  }
}

class GridViewSample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView实战"),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GridViewSample3())),
              child: Text("GridView上下拉"))
        ],
      ),
      body: _GridView(),
    );
  }
}

class _GridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GridViewState();
  }
}

class _GridViewState extends State<_GridView> {
  final data = <String>[];

  @override
  void initState() {
    super.initState();
    _receiveData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
        itemBuilder: (context, index) {
          if (index == data.length - 1 && data.length < 30) {
            _receiveData();
          }
          return Container(
            alignment: Alignment.center,
            color: Colors.yellow,
            child: Text(data[index]),
          );
        });
  }

  void _receiveData() {
    Future.delayed(Duration(seconds: 2)).then((o) {
      setState(() {
        var list = generateWordPairs().take(20).map((word) {
          return word.asCamelCase;
        }).toList();
        data.addAll(list);
      });
    });
  }
}

class GridViewSample3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("GridView下拉上拉"),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GridViewSample4())),
              child: Text("瀑布流"))
        ],
      ),
      body: _GridView2(),
    );
  }
}

class _GridView2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GridView2State();
  }
}

class _GridView2State extends State<_GridView2> {
  final data = <String>[];
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var position = _scrollController.position;
      if (position.maxScrollExtent - position.pixels < 50) {
        _loadMore();
      }
    });
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: GridView.builder(
            controller: _scrollController,
            itemCount: data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.yellow,
                child: Text(data[index]),
              );
            }),
        onRefresh: _refresh);
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(
      seconds: 2,
    )).then((o) {
      data.clear();
      var list =
          generateWordPairs().take(20).map((w) => w.asCamelCase).toList();
      data.addAll(list);
      setState(() {});
    });
  }

  var isLoadingMore = false;

  Future<void> _loadMore() async {
    if (!isLoadingMore) {
      isLoadingMore = true;
      Future.delayed(Duration(seconds: 2), () {
        var list =
            generateWordPairs().take(20).map((w) => w.asCamelCase).toList();
        data.addAll(list);
        isLoadingMore = false;
        setState(() {});
      });
    }
  }
}

class GridViewSample4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StaggeredGridView"),
      ),
      body: StaggeredGridView.countBuilder(
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        crossAxisCount: 4,
        itemCount: 11,
        itemBuilder: (context, index) => Container(
              color: Colors.green,
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("$index"),
              ),
            ),
        staggeredTileBuilder: (index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 1),
      ),
    );
  }
}
