import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:intl/intl.dart';

class AnalogClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: 200,
              height: 200,
              child: FlutterAnalogClock(
                centerPointColor: Colors.blue.shade800,
                tickColor: Colors.blue.shade800,
                dateTime: DateTime.now(),
                secondHandColor: Colors.blue.shade800,
                borderColor: Colors.blue.shade800,
              ),
            ),
            Positioned(
              width: 200,
              height: 200,
              child: Text(
                'WebHR',
                style: TextStyle(
                    color: Colors.blue.shade800, fontWeight: FontWeight.w500),
              ),
              top: 130,
              left: 80,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          DateFormat.yMMMMEEEEd().format(DateTime.now()),
          style: TextStyle(fontSize: 18, color: Colors.grey),
        )
      ],
    );
  }
}
