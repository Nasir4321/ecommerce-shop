import 'package:flutter/material.dart';

class LogoutPopup extends StatefulWidget {
  final Function onLogoutButtonPress;
  LogoutPopup(this.onLogoutButtonPress);

  @override
  _LogoutPopupState createState() => _LogoutPopupState();
}

class _LogoutPopupState extends State<LogoutPopup> {
  @override
  Widget build(BuildContext context) {
    final userPasswordController = TextEditingController();

    return IconButton(
        icon: Icon(Icons.exit_to_app),
        color: Colors.blue.shade800,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  title: Text('Logout ${userPasswordController.text}'),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: userPasswordController,
                            enableSuggestions: false,
                            autocorrect: false,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.vpn_key_sharp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10.0),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            widget.onLogoutButtonPress();
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            // background color
                            primary: Colors.lightBlue[800],
                            // padding:EdgeInsets.symmetric(vertical: buttonState == 1 ? 5 : 10),
                          )),
                    )
                  ],
                );
              });
        });
  }
}
