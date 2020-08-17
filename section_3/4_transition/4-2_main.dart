/* 4-2. TabBar */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final _tab = <Tab> [  // タブバーの表示
    Tab( text:"Railway", icon: Icon(Icons.directions_railway)),
    Tab( text:"Subway", icon: Icon(Icons.directions_subway)),
    Tab( text:"Walk", icon: Icon(Icons.directions_walk)),
  ];

  Widget build(BuildContext context) {
    return DefaultTabController(  // タブを制御
      length: _tab.length,  // タブの数
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Live!人工知能"),
          bottom: TabBar(  // タブバー
            tabs: _tab,
          ),
        ),
        body: TabBarView(  // 表示画面のウィジェット一覧を渡す
            children: <Widget> [
              TabPage(title: "Railway", icon: Icons.directions_railway),
              TabPage(title: "Subway", icon: Icons.directions_subway),
              TabPage(title: "Walk", icon: Icons.directions_walk),
            ]
        ),
      ),
    );
  }
}

class TabPage extends StatelessWidget {

  final IconData icon;
  final String title;

  const TabPage({Key key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline4;  // 文字のスタイル
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 72.0, color: textStyle.color),
          Text(title, style: textStyle),
        ],
      ),
    );
  }
}
