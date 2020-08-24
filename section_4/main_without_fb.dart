import 'package:flutter/material.dart';

final dummyData = [
  {"name": "Pochi", "votes": 0},
  {"name": "Taro", "votes": 0},
  {"name": "Jiro", "votes": 0},
  {"name": "Shiro", "votes": 0},
  {"name": "Hachi", "votes": 0},
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dog Name Voting",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dog Name Voting")),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildList(dummyData);
  }

  Widget _buildList(List<Map<String, dynamic>> dataList) {
    return ListView.builder(
        padding: const EdgeInsets.all(18.0),
        itemCount: dataList.length,
        itemBuilder: (context, i) {
          return _buildListItem(dataList[i]);
        }
    );
  }

  Widget _buildListItem(Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical:9.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          title: Text(data["name"]),
          trailing: Text(data["votes"].toString()),
          onTap: () {
            setState(() { data["votes"] += 1; });
            },
        ),
      ),
    );
  }
}
