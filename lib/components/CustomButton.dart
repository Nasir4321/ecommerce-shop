import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final title, color, textColor, loading,Width;

  final Function onPressCustomButton;

  CustomButton(
      {this.title,
      this.color,
      this.textColor,
      this.loading,
      this.Width,
      required this.onPressCustomButton});

  _CustomButton createState() => new _CustomButton();
}

class _CustomButton extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     //onTap: widget.onPressCustomButton,
      child: Container(
        height: 40,
        constraints: BoxConstraints(maxWidth: widget.Width != null ? widget.Width : 400, maxHeight: 150),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(5.0)),
        child: Center(
            child: widget.loading == null || widget.loading == false
                ? Text(widget.title, style: TextStyle(color: widget.textColor))
                : SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      backgroundColor: Colors.white,
                    ),
                  )),
      ),
    );
  }
}
