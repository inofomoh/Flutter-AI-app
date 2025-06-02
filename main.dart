
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _result = "No result";

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/mobilenet_v1_1.0_224.tflite",
      labels: "assets/labels.txt",
    );
  }

  runModelOnImage(String path) async {
    var recognitions = await Tflite.runModelOnImage(path: path);
    setState(() {
      _result = recognitions.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('TFLite Image Classifier')),
        body: Center(child: Text(_result)),
      ),
    );
  }
}
