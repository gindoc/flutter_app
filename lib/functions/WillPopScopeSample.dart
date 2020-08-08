import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/widgets/Toast.dart' as T;

class WillPopScopeSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WillPopScopeSampleState();
  }
}

class _WillPopScopeSampleState extends State<WillPopScopeSample> {
  DateTime _lastPressedTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("WillPopScope"),
          ),
          body: Center(
            child: Text("WillPopScope"),
          ),
        ),
        onWillPop: () async {
          if (_lastPressedTime == null ||
              DateTime.now().difference(_lastPressedTime) >
                  Duration(seconds: 1)) {
            _lastPressedTime = DateTime.now();
            Fluttertoast.showToast(
              msg: "再按一次退出页面",
              toastLength: Toast.LENGTH_SHORT,
              timeInSecForIos: 1,
              fontSize: 16,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
            );
//            T.Toast.toast(context, "再按一次退出页面");
            return false;
          }
          return true;
        });
  }

  @override
  void dispose() {
    Fluttertoast.cancel();
    super.dispose();
  }
}
