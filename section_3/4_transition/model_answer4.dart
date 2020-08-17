/* 演習4の解答例 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => MainPage(),
        '/subpage1': (BuildContext context) => SubPage1(),
        '/subpage2': (BuildContext context) => SubPage2(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mainページ"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Main"),
              RaisedButton( // 立体的なボタン
                onPressed: () => Navigator.of(context).pushNamed("/subpage1"),  // 次の画面を乗せる
                child: Text("Sub1へ"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SubPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sub1"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Sub1"),
              RaisedButton( // 立体的なボタン
                onPressed: () => Navigator.of(context).pushNamed("/subpage2"),  // 次の画面を乗せる
                child: Text("Sub2へ"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SubPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sub2"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Sub2"),
            ],
          ),
        ),
      ),
    );
  }
}
