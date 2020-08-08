import 'package:flutter/material.dart';

class SwitchAndCheckBoxSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch、CheckBox"),
      ),
      body: SwitchAndCheckBox(),
    );
  }
}

class SwitchAndCheckBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwitchAndCheckBoxState();
  }
}

class _SwitchAndCheckBoxState extends State<SwitchAndCheckBox> {
  bool _switchState = true;
  bool _checkBoxState = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Switch(
            value: _switchState,
            onChanged: (bool) {
              setState(() {
                _switchState = bool;
              });
            }),
        Checkbox(
            value: _checkBoxState,
            onChanged: (bool) => setState(() {
                  _checkBoxState = bool;
                }))
      ],
    );
  }
}
