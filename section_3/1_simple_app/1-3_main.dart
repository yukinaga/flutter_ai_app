/* 1-3. Statefulウィジェット */

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp()); // 引数のWidgetが画面いっぱいに表示される

// 状態を管理するクラスは、Stateクラスを継承
class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}

// StatefulなWidgetのクラスは、StatefulWidgetを継承
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

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
          child: RandomWords(),
        ),
      ),
    );
  }
}
