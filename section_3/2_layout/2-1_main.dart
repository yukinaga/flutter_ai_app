/* 2-1. Container */

import 'package:flutter/material.dart';

void main() => runApp(MyApp()); // 引数のWidgetが画面いっぱいに表示される

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Simple App",
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.blue,
            width: 300.0,
            height: 300.0,
            child: Text("Live!人工知能"),
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
