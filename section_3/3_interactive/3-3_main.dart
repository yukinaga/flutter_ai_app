/* 3-3. スイッチ */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Simple App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Live!人工知能"),
        ),
        body: Center(
          child: MyForm(),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  bool _active = false;

  void _changeSwitch(bool e) {
    setState(() {  // 状態を保持する変数を変更する処理は、setState内に記述する
      _active = e;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Icon(
                Icons.thumb_up,
                color: _active ? Colors.orange : Colors.grey,
                size: 100.0,
              ),
            ),
            Switch(  // スイッチ
              value: _active,
              onChanged: _changeSwitch,
            )
          ],
        )
    );
  }
}
