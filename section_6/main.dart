import 'dart:io';

import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyAIApp());
}
class MyAIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SMILE SNS",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainForm(),
    );
  }
}

class MainForm extends StatefulWidget {
  @override
  _MainFormState createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  String _name ="";
  String _processingMessage = "";
  final FaceDetector _faceDetector = FirebaseVision.instance.faceDetector(
      FaceDetectorOptions(
          mode: FaceDetectorMode.accurate,
          enableLandmarks: true,
          enableClassification: true
      )
  );
  final ImagePicker _picker = ImagePicker();

  void _getImageAndFindFace(BuildContext context, ImageSource imageSource) async {
    setState(() {
      _processingMessage = "Processing...";
    });

    final PickedFile pickedImage = await _picker.getImage(source: imageSource);
    final File imageFile = File(pickedImage.path);

    if (imageFile != null) {
      final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(imageFile);
      List<Face> faces = await _faceDetector.processImage(visionImage);
      if(faces.length > 0){
        String imagePath = "/images/" + Uuid().v1() + basename(pickedImage.path);
        StorageReference ref = FirebaseStorage.instance.ref().child(imagePath);
        final StorageTaskSnapshot storedImage = await ref.putFile(imageFile).onComplete;
        if(storedImage.error == null){
          final String downloadUrl = await storedImage.ref.getDownloadURL();
          Face largestFace = findLargestFace(faces);

          FirebaseFirestore.instance.collection("smiles").add({
            "name": _name,
            "smile_prob": largestFace.smilingProbability,
            "image_url": downloadUrl,
            "date": Timestamp.now(),
          });
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TimelinePage(),)
          );
        }
      }
    }

    setState(() {
      _processingMessage = "";
    });
  }

  Face findLargestFace(List<Face> faces){
    Face largestFace = faces[0];
    for (Face face in faces) {
      if(face.boundingBox.height+face.boundingBox.width >
          largestFace.boundingBox.height+largestFace.boundingBox.width){
        largestFace = face;
      }
    }
    return largestFace;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMILE SNS"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(30.0)),
          Text(
              _processingMessage,
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 32.0,
            )
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Please input your name.",
              labelText: "YOUR NAME",
            ),
            onChanged:(text){
              setState(() {_name = text;});
            },
          )
        ],
      ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed:(){_getImageAndFindFace(context, ImageSource.gallery);} ,
              tooltip: "Select Image",
              heroTag: "gallery",
              child: Icon(Icons.add_photo_alternate),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            FloatingActionButton(
              onPressed:(){_getImageAndFindFace(context, ImageSource.camera);} ,
              tooltip: "Take Photo",
              heroTag: "camera",
              child: Icon(Icons.add_a_photo),
            ),
          ],
        )
    );
  }
}

class TimelinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMILE SNS"),
      ),
      body: Container(
        child: _buildBody(context),
      )
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("smiles").orderBy("date", descending: true).limit(10).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapList) {
    return ListView.builder(
        padding: const EdgeInsets.all(18.0),
        itemCount: snapList.length,
        itemBuilder: (context, i) {
          return _buildListItem(context, snapList[i]);
        }
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snap) {
    Map<String, dynamic> _data = snap.data();
    DateTime _datetime = _data["date"].toDate();
    var _formatter = DateFormat("MM/dd HH:mm");
    String postDate = _formatter.format(_datetime);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical:9.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          leading: Text(postDate),
          title: Text(_data["name"]),
          subtitle: Text("は"
              + (_data["smile_prob"]*100.0).toStringAsFixed(1)
              + "%の笑顔です。"
          ),
          trailing: Text(
              _getIcon(_data["smile_prob"]),
              style: TextStyle(fontSize: 24,),
          ),
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImagePage(_data["image_url"]),)
            );
          },
        ),
      ),
    );
  }

  String _getIcon(double smileProb){
    String icon = "";
    if(smileProb < 0.2){
      icon = "😧";
    }else if(smileProb < 0.4){
      icon ="😌";
    }else if(smileProb < 0.6){
      icon ="😀";
    }else if(smileProb < 0.8){
      icon ="😄";
    }else{
      icon ="😆";
    }
    return icon;
  }
}

class ImagePage extends StatelessWidget {
  String _imageUrl = "";

  ImagePage(String imageUrl){
    this._imageUrl = imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMILE SNS"),
      ),
      body: Center(
        child: Image.network(_imageUrl),
      ),
    );
  }
}
