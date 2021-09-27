import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final Widget myIcon;
  final Color buttonColor;
  final Function onButtonPress;

  RoundedIconButton(this.myIcon, this.buttonColor, this.onButtonPress);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: buttonColor ?? Colors.grey.shade300,
        // button color
        child: InkWell(
          splashColor: Colors.blue.shade800, // inkwell color
          child: SizedBox(
              width: 50,
              height: 50,
              child: Center(
                child: myIcon,
              )),
          onTap: () {
            onButtonPress();
          },
        ),
      ),
    );
  }
}
