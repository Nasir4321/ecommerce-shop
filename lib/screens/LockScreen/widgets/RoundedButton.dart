import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final Function onButtonPress;

  RoundedButton(this.label, this.onButtonPress);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.blue.shade800, // inkwell color
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey.shade300),
                shape: BoxShape.circle),
            child: Center(
                child: Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Colors.grey.shade700),
            )),
          ),
          onTap: () {
            onButtonPress(label);
          },
        ),
      ),
    );
  }
}
