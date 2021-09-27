import 'package:flutter/material.dart';
import './widgets/CaptureImageWithSignOut.dart';
import './widgets/UserDetails.dart';
import './widgets/CustomCards.dart';

class SignOutAttendanceScreen extends StatefulWidget {
  @override
  _SignOutAttendanceScreenState createState() =>
      _SignOutAttendanceScreenState();
}

class _SignOutAttendanceScreenState extends State<SignOutAttendanceScreen> {
  void onSignOut() async {
    Navigator.pushNamed(context, "/CaptureImage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      child: Column(
        children: [
          CaptureImageWithSingOut(onSignOut),
          UserDetails(),
          CustomCard(),
        ],
      ),
    )));
  }
}
