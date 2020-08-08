import 'package:flutter/material.dart';

class ScaffoldSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaffoldSampleState();
  }
}

class _ScaffoldSampleState extends State<ScaffoldSample>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  TabController _tabController;

//  List tabs = ["新闻", "历史", "图片"];
  final tabs = [
    Tab(text: "新闻", icon: Icon(Icons.notifications_active)),
    Tab(text: "历史", icon: Icon(Icons.history)),
    Tab(text: "图片", icon: Icon(Icons.photo)),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scaffold/TabBar/TabBarView",
          style: TextStyle(fontSize: 14),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share, color: Colors.white),
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScaffoldSample2();
                  })))
        ],
        bottom: TabBar(
          tabs: tabs,
          controller: _tabController,
        ),
      ),
      drawer: CustomDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text("Business")),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text("School")),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAdd,
        child: Icon(Icons.add),
      ),
      body: TabBarView(
          controller: _tabController,
          children: tabs.map((tab) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                tab.text,
                textScaleFactor: 3,
              ),
            );
          }).toList()),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
//          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 45, left: 15),
                child: Row(
                  children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        "images/ic_launcher.png",
                        width: 80,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "GIndoc",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: Text("Add account"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text("Manage accounts"),
                  ),
                ],
              ))
            ],
          )),
    );
  }
}

class ScaffoldSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaffoldSampleState2();
  }
}

class _ScaffoldSampleState2 extends State<ScaffoldSample2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScaffoldSample2(BottomAppBar)", style: TextStyle(fontSize: 16),),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: <Widget>[
              Icon(Icons.home),
              SizedBox(),
              Icon(Icons.school)
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
