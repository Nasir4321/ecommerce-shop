import 'package:flutter/material.dart';

class CaptureImage extends StatefulWidget {
  @override
  _CaptureImageState createState() => _CaptureImageState();
}

class _CaptureImageState extends State<CaptureImage> {
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
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(10),
          height: 50,
          child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Sing in',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue[800],
              )),
        )
      ],
    );
  }
}
