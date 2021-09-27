import 'package:flutter/material.dart';
import './widgets/AnalogTimeClock.dart';
import './widgets/Numberpad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LockScreen extends StatefulWidget {
  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  void onNext() async {
    Navigator.pushNamed(context, "/SignOutAttendanceScreen");
  }

  void onLogot() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isUserSignIn', false);
    Navigator.pushReplacementNamed(context, "/StartUpScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: FlatButton(
        //   onPressed: () {
        //     onLogot();
        //   },
        //   child: Icon(
        //     Icons.refresh,
        //     color: Colors.blue.shade800,
        //   ),
        // ),
        title: Container(
          child: Image.asset(
            "assets/kiosk.png",
            fit: BoxFit.contain,
            height: 35,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            color: Colors.blue.shade800,
            onPressed: () {
              Navigator.pushNamed(context, "/OrganizationScreen");
            },
          )
        ],
        elevation: 2,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return (Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnalogClock(),
                  SizedBox(
                    height: 20,
                  ),
                  NumberPad(onNext),
                ],
              ));
            } else {
              return (Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [NumberPad(onNext), AnalogClock()],
              ));
            }
          },
        ),
      ),
    );
  }
}
