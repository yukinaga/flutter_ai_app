/* 演習1 */
/* 以下のコードを実行するとエラーが発生します。コードを追記し、エラーが発生しないようにしましょう。 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp()); // 引数のWidgetが画面いっぱいに表示される

List<String> generateHello({int start, int n}){
  var _hs = <String>[];
  for (int i=start; i<start+n; i++){
    _hs.add("Hello!" + i.toString());
  }
  return _hs;
}

// 状態を管理するクラスは、Stateクラスを継承
class RandomWordsState extends  {
  Widget _buildSuggestions() {
    final _words = <String>[];  // 単語のペアを格納するリスト
    return ListView.builder(
        itemBuilder: (context, i) { // itemBuilderで一行ごとに処理が呼ばれる
          if (i.isOdd) return Divider();  // 奇数行には水平線を表示

          final index = i ~/ 2;  // ~/は結果が整数の割り算
          if (index >= _words.length) {  // 行数がリストの要素数を越えれば
            _words.addAll(generateHello(start: index, n: 10));  // 単語のペアを10個追加
          }
          return _buildRow(_words[index]);
        }
    );
  }

  // 単語のペアから、形式を整えた行のWidgetを作るメソッド
  Widget _buildRow(String word) {
    return ListTile(
      title: Text(
        word,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live!人工知能"),
      ),
      body: _buildSuggestions(),
    );
  }
}

// StatefulなWidgetのクラスは、StatefulWidgetを継承
class RandomWords  {
  @override
  RandomWordsState createState() => RandomWordsState();
}

// 最初に表示するWidgetのクラス
class MyApp extends StatelessWidget {  // StatelessWidgetを継承
  @override
  Widget build(BuildContext context) {  //buildメソッドでUIを作成
    return MaterialApp(  // マテリアルデザインのアプリ
        title: "My Simple App",  // アプリのタイトル
        home: RandomWords()
    );
  }
}
