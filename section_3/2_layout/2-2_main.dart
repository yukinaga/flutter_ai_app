/* 2-2. RowとColumn */

import 'package:flutter/material.dart';

void main() => runApp(MyApp()); // 引数のWidgetが画面いっぱいに表示される

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Simple App",
      home: Container(
        child: Row(  // 行
          mainAxisAlignment: MainAxisAlignment.center,  // 中央に配置（他にstart、end、spaceAroundなど）
          children: <Widget>[
            Column(  // 列
              mainAxisAlignment: MainAxisAlignment.center,  // 中央に配置
              children: <Widget>[
                Container( color: Colors.blue, width: 100, height:100 ),
                Container( color: Colors.red, width: 100, height:100 ),
                Container( color: Colors.yellow, width: 100, height:100 ),
              ],
            ),
            Column(  // 列
              mainAxisAlignment: MainAxisAlignment.center,  // 中央に配置
              children: <Widget>[
                Container( color: Colors.green, width: 100, height:100 ),
                Container( color: Colors.orange, width: 100, height:100 ),
                Container( color: Colors.white, width: 100, height:100 ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
