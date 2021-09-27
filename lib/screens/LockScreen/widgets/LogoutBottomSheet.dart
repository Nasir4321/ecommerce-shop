import 'package:flutter/material.dart';

class LogoutBottomSheet extends StatefulWidget {
  @override
  _LogoutBottomSheetState createState() => _LogoutBottomSheetState();
}

class _LogoutBottomSheetState extends State<LogoutBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: new Wrap(
        children: [
          Text('aaa'),
          TextField(
            decoration: InputDecoration(labelText: 'aaa'),
          )
        ],
      ),
    );
  }
}
