import 'package:flutter/material.dart';

class CustomScrollViewSample extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("CustomScrollView"),
              centerTitle: true,
              background: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&'
                    'sec=1559194223328&di=e05b33e47c4041b3d864d47054f9058e&'
                    'imgtype=0&'
                    'src=http%3A%2F%2Fattachments.gfan.com%2Fforum%2Fattachments2%2F201406%2F28%2F183114tn7tdqt2qqxtvfx2.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
              padding: EdgeInsets.all(8),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                        alignment: Alignment.center,
                        color: Colors.cyan[100 * (index % 9)],
                        child: new Text('grid item $index'),
                      ),
                  childCount: 25,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0,
                ),
              )),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                      alignment: Alignment.center,
                      child: Text("List item $index"),
                      color: Colors.cyan[100 * (index % 9)],
                    ),
                childCount: 30,
              ),
              itemExtent: 50)
        ],
      ),
    );
  }
}
