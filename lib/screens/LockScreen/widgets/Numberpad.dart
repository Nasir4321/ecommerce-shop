import 'package:flutter/material.dart';
import '../widgets/RoundedButton.dart';
import './RoundedIconButton.dart';

class NumberPad extends StatefulWidget {
  final Function onNext;

  NumberPad(this.onNext);

  @override
  _NumberPadState createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  String accessCode = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void onPressButton(String value) {
    setState(() {
      accessCode = '$accessCode$value';
    });
  }

  void onPressClearButton() {
    setState(() {
      accessCode = '';
    });
  }

  void onPressCorrectButton() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: 320,
          height: 380,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedButton('7', onPressButton),
                  RoundedButton('8', onPressButton),
                  RoundedButton('9', onPressButton),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedButton('4', onPressButton),
                  RoundedButton('5', onPressButton),
                  RoundedButton('6', onPressButton),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedButton('1', onPressButton),
                  RoundedButton('2', onPressButton),
                  RoundedButton('3', onPressButton),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedIconButton(
                      Icon(
                        Icons.clear,
                        size: 24,
                        color: Colors.white,
                      ),
                      accessCode == '' ? Colors.red : Colors.blue.shade800,
                      onPressClearButton),
                  RoundedButton('0', onPressButton),
                  RoundedIconButton(
                      Icon(
                        Icons.check,
                        size: 24,
                        color: Colors.white,
                      ),
                      accessCode == '' ? Colors.green : Colors.blue.shade800,
                      widget.onNext),
                ],
              ),
              Container(
                  width: 250,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                    accessCode == "" ? "Enter Access Code" : accessCode,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  )))
            ],
          )),
    );
  }
}
