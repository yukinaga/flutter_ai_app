/* 3-4. スライダー */

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
  double _value = 0.0;

  void _changeSlider(double e) {
    setState(() {  // 状態を保持する変数を変更する処理は、setState内に記述する
      _value = e;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child:Text("値：${_value}")),
            Slider(  // スライダー
              label: '${_value}',
              min: 0,
              max: 10,
              value: _value,
              activeColor: Colors.orange,
              inactiveColor: Colors.blueAccent,
              divisions: 10,
              onChanged: _changeSlider,
            )
          ],
        )
    );
  }
}
