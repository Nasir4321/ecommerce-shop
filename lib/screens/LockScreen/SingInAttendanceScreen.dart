import 'package:flutter/material.dart';
import './widgets/CaptureImage.dart';
import './widgets/UserDetails.dart';
import './widgets/CustomCards.dart';

class SingInAttendusScreen extends StatefulWidget {
  @override
  _SingInAttendusScreenState createState() => _SingInAttendusScreenState();
}

class _SingInAttendusScreenState extends State<SingInAttendusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      child: Column(
        children: [
          CaptureImage(),
          UserDetails(),
          CustomCard(),
        ],
      ),
    )));
  }
}
