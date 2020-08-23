import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return StreamBuilder<QuerySnapshot>(  // Streamを監視して、イベントが通知される度にWidgetを更新する
      stream: FirebaseFirestore.instance.collection("dogs").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(snapshot.data.docs);
      },
    );
  }

  Widget _buildList(List<DocumentSnapshot> snapList) {
    return ListView.builder(
        padding: const EdgeInsets.all(18.0),
        itemCount: snapList.length,
        itemBuilder: (context, i) {
          return _buildListItem(snapList[i]);
        }
    );
  }

  Widget _buildListItem(DocumentSnapshot snap) {
    Map<String, dynamic> data = snap.data();

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
          onTap: () => snap.reference.update({"votes": FieldValue.increment(1)}),
        ),
      ),
    );
  }
}
