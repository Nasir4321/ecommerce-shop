import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

class ViewCaptureImage extends StatelessWidget {
  const ViewCaptureImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;

    new Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/LockScreen');
    });

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.file(File(args)),
            Expanded(child: Text("sing in Succeefully"))
          ],
        ),
      ),
    );
  }
}
