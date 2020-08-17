/* 3-2. テキストの入力 */

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
  String _text = '';

  void _handleText(String e) {
    setState(() {  // 状態を保持する変数を変更する処理は、setState内に記述する
      _text = e;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$_text",
              style: TextStyle(
                color:Colors.blueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(  // テキストを表示
              style: TextStyle(color: Colors.red),
              onChanged: _handleText,
            ),
          ],
        )
    );
  }
}
