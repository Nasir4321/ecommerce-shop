import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  TextEditingController stationController =
      TextEditingController(text: 'Verge System');
  TextEditingController projectController =
      TextEditingController(text: 'WebHR');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      child: Column(
        children: [
          TextField(
            controller: stationController,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 2, color: Colors.blue.shade800),
                ),
                labelText: 'Station',
                labelStyle: TextStyle(
                  color: Colors.grey,
                )),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: projectController,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 2, color: Colors.blue.shade800),
                ),
                labelText: 'Project',
                labelStyle: TextStyle(
                  color: Colors.grey,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 2, color: Colors.blue.shade800),
                ),
                labelText: 'Notes (Optional)',
                labelStyle: TextStyle(
                  color: Colors.grey,
                )),
            keyboardType: TextInputType.multiline,
            minLines: 1, //Normal textInputField will be displayed
            maxLines: 5, // when user presses enter it will adapt to it
          )
        ],
      ),
    );
  }
}
