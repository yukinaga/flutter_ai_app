/* 4-3. Drawer */

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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live!人工知能"),
      ),
      drawer: Drawer( // Drawerの配置
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text("ヘッダーです。"),
              decoration: BoxDecoration(  // Boxによる装飾
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("アイテムその1"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("アイテムその2"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("アイテムその3"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
