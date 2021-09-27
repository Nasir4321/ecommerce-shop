import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.pushReplacementNamed(context, "/SignUpScreen");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image(
                  image: AssetImage("assets/logo.png"),
                  height: 20.h,
                  width: 20.h,
                  fit: BoxFit.contain,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SHOP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.indigo),
                    ),
                    Text(
                      ' ECOMMERCE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.amber),
                    ),
                  ],
                ),
                Image(
                  image: AssetImage("assets/splashimage.png"),
                  height: 60.h,
                  width: 60.h,
                  fit: BoxFit.cover,
                )
              ],
            ))));
  }
}
