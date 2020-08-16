/* 1-1. Hello World */

import 'package:flutter/material.dart';

void main() => runApp(MyApp()); // 引数のWidgetが画面いっぱいに表示される

// 最初に表示するWidgetのクラス
class MyApp extends StatelessWidget {  // StatelessWidgetを継承
  @override
  Widget build(BuildContext context) {  //buildメソッドでUIを作成
    return MaterialApp(  // マテリアルデザインのアプリ
      title: "My Simple App",  // アプリのタイトル
      home: Scaffold(  // マテリアルデザインの土台
        appBar: AppBar(  // ヘッダーに表示するアプリケーションバー
          title: Text("Live!人工知能"),  // タイトルを表示
        ),
        body: Center(  // 中央に配置
          child: Text("Hello Widgets!"),  // 文字列を配置
        ),
      ),
    );
  }
}
