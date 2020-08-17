/* 4-1. 画面遷移 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => MainPage(),  // 最初のページ
        '/subpage': (BuildContext context) => SubPage()  // 次のページ
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
                onPressed: () => Navigator.of(context).pushNamed("/subpage"),  // 次の画面を乗せる
                child: Text("Subページへ"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subページ"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Sub"),
              RaisedButton(
                onPressed: () => Navigator.of(context).pop(),  // この画面を取り除く
                child: Text("戻る"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
