/* 演習2の解答例 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Simple App",
      home: Container(
        child: Row(  // 行
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(  // 列
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container( color: Colors.red, width: 100, height:100 ),
                Container( color: Colors.green, width: 100, height:100 ),
                Container( color: Colors.blue, width: 100, height:100 ),
                Container( color: Colors.yellow, width: 100, height:100 ),
              ],
            ),
            Column(  // 列
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container( color: Colors.red, width: 100, height:100 ),
                Container( color: Colors.green, width: 100, height:100 ),
                Container( color: Colors.blue, width: 100, height:100 ),
                Container( color: Colors.yellow, width: 100, height:100 ),
              ],
            ),
            Column(  // 列
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container( color: Colors.red, width: 100, height:100 ),
                Container( color: Colors.green, width: 100, height:100 ),
                Container( color: Colors.blue, width: 100, height:100 ),
                Container( color: Colors.yellow, width: 100, height:100 ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
