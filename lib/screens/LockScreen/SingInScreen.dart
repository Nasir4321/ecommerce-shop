import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './widgets/BgImage.dart';
import './widgets/LoginForm.dart';

class SingInScreen extends StatefulWidget {
  @override
  _SingInScreenState createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  void onLogin() {
    saveUserState();
    Navigator.pushReplacementNamed(context, "/AccesCode");
  }

  saveUserState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isUserSignIn', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: OrientationBuilder(builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/kioskBg.png',
                        width: 300,
                        height: 300,
                      ),
                      (LoginForm(onLogin)),
                    ],
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/kioskBg.png',
                        width: 300,
                        height: 300,
                      ),
                      (LoginForm(onLogin)),
                    ],
                  ),
                );
              }
            })));
  }
}
