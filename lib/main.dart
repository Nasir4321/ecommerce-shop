import 'package:flutter/material.dart';
import 'package:shop_ecommerce/screens/SignInScreen/SignInScreen.dart';
import 'package:shop_ecommerce/screens/SignUpScreen/SignUp.dart';
import 'package:shop_ecommerce/screens/Splash/SplashScreen.dart';

import 'package:sizer/sizer.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            '/SignUpScreen': (context) => SignUp(),
            '/SignInScreen': (context) => SignInScreen(),
          },
        );
      },
    );
  }
}
