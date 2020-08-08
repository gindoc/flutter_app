import 'dart:convert';

import 'package:flutter/material.dart';

class SingleChildScrollViewSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    final ascii = new List<int>();
    for (int i = 65; i < 91; i++) {
      ascii.add(i);
    }
    String str = AsciiCodec().decode(ascii);

    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView"),
      ),
      body: Scrollbar(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
              children: str
                  .split("")
                  .map((s) => Text(
                        s,
                        textScaleFactor: 2,
                      ))
                  .toList()),
        ),
      )),
    );
  }
}
