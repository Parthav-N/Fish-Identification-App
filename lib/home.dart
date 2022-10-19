import 'dart:io';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_authentication/signup.dart';
import 'package:flutter_authentication/TFLiteModel.dart';
import 'package:tflite/tflite.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Page(),
    );
  }
}

enum ImageSourceType { gallery, camera }

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick Your Pic"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Image.network(
                  "https://res.cloudinary.com/dcsi333w7/image/upload/v1661272332/samples/sih/scan_frzqex.jpg"),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              minWidth: 300,
              height: 70,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(50)),
              color: Colors.blue,
              child: Text(
                "Pick Image from Gallery",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onPressed: (() => pickImageFromGallery(context)),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              minWidth: 300,
              height: 70,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(50)),
              color: Colors.blue,
              child: Text(
                "Pick Image from Camera",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                pickImageFromCamera(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => pickImageFromGallery(context)),
        tooltip: "Pick Image",
        child: const Icon(Icons.image),
      ),
    );
  }

  Future pickImageFromGallery(context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image = File(pickedFile!.path);
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => TfliteModel(
                imgFile: image,
              )),
    );
  }

  Future pickImageFromCamera(context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    File image = File(pickedFile!.path);
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => TfliteModel(
                imgFile: image,
              )),
    );
  }
}
