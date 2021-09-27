import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              width: 300,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(43, 129, 199, 1),
                  Color.fromRGBO(86, 204, 242, 1)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                // color: Colors.redAccent,
                borderRadius: BorderRadius.circular(
                  10,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(1, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      backgroundColor: Color.fromRGBO(86, 204, 242, 1),
                      label: Text(
                        'Upcoming',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Text(
                      '09:00 AM - 06:00 PM',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    Text(
                      'WebHR UI Projects',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Meal Break 1 Hour',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 14),
                    )
                  ]),
            );
          }),
    );
  }
}
