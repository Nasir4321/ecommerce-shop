import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'dart:core';

class CaptureImage extends StatefulWidget {
  CaptureImage({Key key}) : super(key: key);

  @override
  _CaptureImageState createState() => _CaptureImageState();
}

class _CaptureImageState extends State<CaptureImage> {
  List<CameraDescription> camera;
  CameraController cameraController;
  int count = 3;
  Timer timer;

  @override
  void initState() {
    getCamers();
    super.initState();
  }

  @override
  void dispose() {
    cameraController?.dispose();
    timer.cancel();
    super.dispose();
  }

  void getCamers() async {
    camera = await availableCameras();
    cameraController = CameraController(camera[1], ResolutionPreset.ultraHigh);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        myDuration();
      });
    });
  }

  void myDuration() {
    timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      if (count > 0) {
        setState(() {
          count--;
        });
      } else {
        timer.cancel();
        onCapture(context);
      }
    });
  }

  onCapture(context) async {
    final image = await cameraController.takePicture();
    final imagePath = image?.path;
    // final bytes = Io.File(imagePath).readAsBytesSync();
    // //final SharedPreferences prefs = await _prefs;

    // String img64 = base64Encode(bytes);

    // final imagePath = ' i am ahmed';

    Navigator.pushReplacementNamed(
      context,
      "/ViewCaptureImage",
      arguments: imagePath,
    );
    //print(img64.substring(0, 100));
    // print('imagePath $imagePath');
    // print('ispreview== $isPreview');
    // print('Base64  $img64');
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return Scaffold(
        body: Center(
          child: Container(
            child: Text('aaa'),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          height: double.infinity,
          child: Stack(children: [
            CameraPreview(cameraController),
            Positioned(
                bottom: 30.0,
                child: new Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80.0,
                    // decoration: new BoxDecoration(color: Colors.red),
                    alignment: Alignment.center,
                    child: Container(
                      width: 80,
                      height: 80,
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                          color: Colors.blue.shade800, shape: BoxShape.circle),
                      child: Text(
                        count.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ))),
          ]),
        ),
      );
    }
  }
}

// CameraPreview(cameraController)
