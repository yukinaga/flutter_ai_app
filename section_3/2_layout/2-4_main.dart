/* 2-4. Stack */

import 'package:flutter/material.dart';

void main() => runApp(MyApp()); // 引数のWidgetが画面いっぱいに表示される

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("My Simple App"),
            ),
            body: Stack(  // 重ねて表示
              children: <Widget>[
                Container(
                    width: 200,
                    height: 200,
                    color:Colors.red
                ),
                Container(
                  width: 100,
                  height: 120,
                  color: Colors.green,
                ),
                Container(
                  width: 50,
                  height: 70,
                  color: Colors.blue,
                )
              ],
            )
        )
    );
  }
}
