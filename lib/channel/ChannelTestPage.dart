import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChannelTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter与原生交互(Channel)"),
      ),
      body: ChannelTest(),
    );
  }
}

class ChannelTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChannelTestState();
  }
}

class _ChannelTestState extends State<ChannelTest> {
  static const platform = const MethodChannel('samples.flutter.io/battery');

  String _batteryLevel = 'Unknown battery level.';

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          FlatButton(
              onPressed: _getBatteryLevel, child: Text("跳转到Android页面..")),
          Text(
            _batteryLevel,
            style: TextStyle(color: Colors.red),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      color: Colors.grey,
      width: MediaQuery.of(context).size.width,
    );
  }
}
