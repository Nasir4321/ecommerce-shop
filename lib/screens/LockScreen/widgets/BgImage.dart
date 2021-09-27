import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/LoginBG19.jpg",
      fit: BoxFit.cover,
    );
  }
}
