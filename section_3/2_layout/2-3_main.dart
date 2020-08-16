/* 2-3. Expanded */

import 'package:flutter/material.dart';

void main() => runApp(MyApp()); // 引数のWidgetが画面いっぱいに表示される

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Simple App",
      home: Container(
        child: Row(
          children: <Widget>[
            Expanded(  // 引き延ばして表示
              flex: 1,
                child:Container( color: Colors.red)
            ),
            Expanded(
              flex: 2,
              child:Container( color: Colors.green),
            ),
            Expanded(
              child:Container( color: Colors.blue),
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
