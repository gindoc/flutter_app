import 'dart:async';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Containers.dart';
import 'package:flutter_app/Layouts.dart';

import 'package:flutter_app/LifeCyclePage.dart';
import 'package:flutter_app/NewRoute.dart';
import 'package:flutter_app/StateManager.dart';
import 'package:flutter_app/Widgets.dart';
import 'package:flutter_app/channel/ChannelTestPage.dart';

import 'EventHandlingWidgets.dart';
import 'FunctionWidgets.dart';
import 'ScrollWidgets.dart';

void collectLog(String line) {
//  ... //收集日志
}

void reportErrorAndLog(FlutterErrorDetails details) {
//  ... //上报错误和日志逻辑
}

FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
//  ...// 构建错误信息
}

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    // 可以在此处处理异常，如：上报异常
    print(details);
    print("123444");
    reportErrorAndLog(details);
  };
  runZoned(
    // 在"沙箱中执行"
    () => runApp(MyApp()),
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        parent.print(zone, "Intercepted: $line"); // 该"沙箱"中所有的的print都会被拦截
        collectLog(line); //手机日志
      },
    ),
    onError: (Object obj, StackTrace stack) {
      var details = makeDetails(obj, stack);
      reportErrorAndLog(details);
    },
  );
  testForCatchError();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    throw Exception("ddd");
    print("有被拦截吗");

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 注册路由表
      routes: {
        "new_page": (context) => NewRoute(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text('$_counter',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 32)
//              style: Theme.of(context).textTheme.display1,
                  ),
              RandomWordsWidget(),
              Image(
                image: new AssetImage('launch_icon/ic_launcher.png'),
                height: 50,
                width: 50,
              ),
//            ImageWidget(),
              FlatButton(
                child: Text("open new route"),
                textColor: Colors.blue,
                onPressed: () {
//                Navigator.push(context,
//                    new MaterialPageRoute(builder: (context) {
//                  return new NewRoute();
//                }));
                  Navigator.pushNamed(context, "new_page");
                },
              ),
              FlatButton(
                child: Text("生命周期示例"),
                textColor: Colors.red,
                onPressed: () => Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new LifeCyclePage();
                })),
              ),
              FlatButton(
                child: Text("状态管理"),
                textColor: Colors.blue,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return StateManager();
                })),
              ),
              FlatButton(
                child: Text("Widget列表"),
                textColor: Colors.teal[700],
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return Widgets();
                })),
              ),
              FlatButton(
                child: Text("Layout列表"),
                textColor: Colors.amber[700],
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return Layouts();
                })),
              ),
              FlatButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return Containers();
                })),
                child: Text("Container列表"),
                textColor: Colors.amber[900],
              ),
              FlatButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return ScrollWidgets();
                })),
                child: Text("Scroll Widgets"),
                textColor: Colors.indigo[500],
              ),
              FlatButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return FunctionWidgets();
                })),
                child: Text("Function Widgets"),
                textColor: Colors.purpleAccent,
              ),
              FlatButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventHandlingWidgets())),
                child: Text("事件处理"),
                textColor: Colors.teal,
              ),
              FlatButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return ChannelTestPage();
                })),
                child: Text("Channel"),
                textColor: Colors.teal[700],
              ),
//            FlatButton(
//                onPressed: _getBatteryLevel, child: Text("跳转到Android页面..")),
//            Text(_batteryLevel),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('launch_icon/ic_launcher.png');
  }
}

// 在"沙箱"中执行代码，可以捕获动态异常，配合FlutterError.onError可以捕获所有异常
void testForCatchError() {
  var future = new Future.value(499);
  runZoned(() {
    var future2 = future.then((_) {
      throw "error in first error-zone";
    });
    runZoned(() {
      var future3 = future2.catchError((e) {
        print("Never reached!");
      });
    }, onError: (e) {
      print("unused error handler");
    });
  }, onError: (e) {
    print("catches error of first error-zone.");
  });
}
