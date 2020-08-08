import 'package:flutter/material.dart';

class DecoratedBoxSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DecoratedBox"),
        ),
        body: Padding(
          padding: EdgeInsets.all(50),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.orange[700]],
              ),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2, 2),
                  blurRadius: 4,
//              spreadRadius: 4
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 80),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
