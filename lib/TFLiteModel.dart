import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/results.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class TfliteModel extends StatefulWidget {
  File imgFile;
  TfliteModel({Key? key, required this.imgFile}) : super(key: key);

  @override
  _TfliteModelState createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  late File _image;
  late List _results;
  bool imageSelect = false;
  @override
  void initState() {
    super.initState();
    loadModel(widget.imgFile);
  }

  Future loadModel(File imgFile) async {
    print("Models loading started");
    Tflite.close();
    String res;
    print("Loading model...");
    res = (await Tflite.loadModel(
        model: "assets/model76.tflite", labels: "assets/index.txt"))!;
    print("Models loading status: $res");
    imageClassification(imgFile);
  }

  Future imageClassification(File image) async {
    print("In Image Classifier");
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      print("Results obtained...");
      _results = recognitions!;
      _image = image;
      imageSelect = true;
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => Results(
                  image: _image,
                  results: _results,
                )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading..."),
      ),
      // body: ListView(
      //   children: [
      //     (imageSelect)
      //         ? Container(
      //             margin: const EdgeInsets.all(10),
      //             //child: Image.file(_image),
      //           )
      //         : Container(
      //             margin: const EdgeInsets.all(10),
      //             child: const Opacity(
      //               opacity: 0.8,
      //               child: Center(
      //                 child: Text("No image selected"),
      //               ),
      //             ),
      //           ),
      //   ],
      // )
    );
  }
}
