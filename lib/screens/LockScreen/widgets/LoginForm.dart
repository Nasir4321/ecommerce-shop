import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final Function onLogin;
  LoginForm(this.onLogin);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  final userNameController = TextEditingController();
  final userPasswordController = TextEditingController();
  final organizationCodeController = TextEditingController();

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Container(
              child: Image.asset(
                "assets/logo.png",
                fit: BoxFit.contain,
                height: 50,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: userNameController,
            decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person)),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: userPasswordController,
            enableSuggestions: false,
            autocorrect: false,
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.vpn_key_sharp),
              suffixIcon: IconButton(
                onPressed: () {
                  _toggle();
                },
                icon: _obscureText ? Icon(Icons.lock) : Icon(Icons.line_style),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: organizationCodeController,
            textAlign: TextAlign.center,
            enableSuggestions: false,
            autocorrect: false,
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelText: 'Organization Code',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.business),
              prefixText: 'https://',
              suffixText: '.webhr.co/',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  widget.onLogin();
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  // background color
                  primary: Colors.lightBlue[800],
                  // padding:EdgeInsets.symmetric(vertical: buttonState == 1 ? 5 : 10),
                )),
          )
        ],
      ),
    );
  }
}

// AnimatedContainer(
//   height: 60,
//   width: MediaQuery.of(context).size.width,
//   duration: const Duration(seconds: 2),
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.all(Radius.circular(5)),
//     boxShadow: <BoxShadow>[
//       BoxShadow(
//           color: Colors.grey.shade200,
//           offset: Offset(2, 4),
//           blurRadius: 5,
//           spreadRadius: 2)
//     ],
//   ),
//   curve: Curves.easeIn,
//   child: Material(
//     color: Colors.amber,
//     borderRadius: BorderRadius.all(Radius.circular(5)),
//     child: Center(
//       child: InkWell(
//         onTap: () {
//           setState(() {});
//         },
//         child: Text('Singin'),
//       ),
//     ),
//   ),
// )
