import 'package:flutter/material.dart';

class CaptureImageWithSingOut extends StatefulWidget {
  final Function onSingOut;
  CaptureImageWithSingOut(this.onSingOut);
  @override
  _CaptureImageWithSingOutState createState() =>
      _CaptureImageWithSingOutState();
}

class _CaptureImageWithSingOutState extends State<CaptureImageWithSingOut> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 50, 10, 20),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.8, color: Colors.blue.shade700),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.blue.shade800,
                  size: 30,
                ),
              ),
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Capture Your Image',
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Make Sure Your GPS Location is on',
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  )
                ],
              )),
            ],
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Out for lunch',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(11, 208, 124, 1),
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Out for Break',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(86, 204, 242, 1))),
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(10),
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    widget.onSingOut();
                  },
                  child: Text(
                    'Sing Out',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(235, 87, 87, 1))),
            )
          ],
        )
      ],
    );
  }
}
