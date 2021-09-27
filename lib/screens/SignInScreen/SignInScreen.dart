import 'dart:convert';
import 'package:flutter/material.dart';
import '../../components/CustomButton.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import '../../services/Services.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // void onSinginButtonPress() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   if (_formKey.currentState.validate()) {
  //     Services s = new Services();
  //     var userLoginResponse = await s.userLogin({
  //       "u": userNameController.text,
  //       "p": "NUCTBA",
  //       "dt": " ",
  //       "did": " ",
  //       "voipt": " ",
  //     });
  //
  //     if (userLoginResponse[0]['AuthStatus'] == 'AUTHSUCCESS') {
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       await prefs.setBool('isUserSignIn', true);
  //       await prefs.setString(
  //           'loginUserData', jsonEncode(userLoginResponse[0]));
  //       Get.offAllNamed("/HomeScreen");
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Incorrect Username or Password')),
  //       );
  //     }
  //   }
  //   setState(() {
  //     loading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/SignIn.jpg',
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                        controller: userNameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Username ",
                            prefixIcon: Icon(Icons.person_outline)),
                        validator: (value) {
                          if (value == "" || value == null)
                            return 'Please Enter Username';
                          else
                            return null;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                        controller: passwordController,
                        obscureText: isPasswordVisible,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Password ",
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                                child: isPasswordVisible
                                    ? Icon(Icons.visibility_off_outlined)
                                    : Icon(Icons.visibility_outlined))),
                        validator: (value) {
                          if (value == "" || value == null)
                            return 'Please Enter Password';
                          else
                            return null;
                        },
                      ),
                      GestureDetector(
                        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Forget Password ?  ',
                              style: TextStyle(color: Colors.blue.shade800),
                            )),
                      ),
                      CustomButton(
                          title: 'Sign In',
                          loading: loading,
                          color: Colors.indigo,
                          textColor: Colors.white,
                          onPressCustomButton: () {
                          //  onSinginButtonPress();
                          })
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New Here? ',
                      style: TextStyle(color: Colors.indigo, fontSize: 12.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/SignUpScreen");
                      },
                      child: Text(
                        'sign in',
                        style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp),
                      ),
                    )
                  ],
                ),
              )


            ],
          ),

      ),
    );
  }
}
