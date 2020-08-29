import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Face Finder",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FaceFinder(),
    );
  }
}

class FaceFinder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FaceFinderState();
}

class _FaceFinderState extends State<FaceFinder> {
  File _imageFile;
  final ImagePicker _picker = ImagePicker();

  void _getImageAndFindFace(ImageSource imageSource) async {
    setState(() {
      _imageFile = null;
    });

    final PickedFile pickedImage = await _picker.getImage(source: imageSource);
    final File imageFile = File(pickedImage.path);

    setState(() {
      _imageFile = imageFile;
    });
  }

  Widget _makeImage() {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.file(_imageFile).image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Face Finder"),
      ),
      body: _imageFile == null
          ? Center(child: Text("No image selected."))
          : _makeImage(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed:(){_getImageAndFindFace(ImageSource.gallery);} ,
            tooltip: "Select Image",
            child: Icon(Icons.add_photo_alternate),
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          FloatingActionButton(
            onPressed:(){_getImageAndFindFace(ImageSource.camera);} ,
            tooltip: "Take Photo",
            child: Icon(Icons.add_a_photo),
          ),
        ],
      )
    );
  }
}
