import 'package:flutter/material.dart';
import '../../components/CustomButton.dart';
import 'package:sizer/sizer.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true;

  final _formKey = GlobalKey<FormState>();

  static const TextStyle PreSufTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 16,
    height: 0.5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/SignUp.jpg',
            ),
            Container(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email_rounded),
                            ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormField(
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                        controller: _usernameController,
                        decoration: InputDecoration(
                            hintText: "Username",
                            prefixIcon: Icon(Icons.person_rounded)),
                      ),
                      SizedBox(
                        height: 2.h,
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
                      SizedBox(
                        height: 3.h,
                      ),
                      CustomButton(
                          title: 'Sign Up',
                          color: Colors.indigo,
                          textColor: Colors.white,
                          //loading: loading,
                          onPressCustomButton: () {}),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(color: Colors.indigo, fontSize: 12.sp),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/SignInScreen");
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
            ))
          ],
        ),
      ),
    );
  }
}

// CustomInput(
//   validator: (value) {
//     if (value == null || value.isEmpty) {
//       return '* Please enter company name';
//     }
//     return null;
//   },
//   textInputController: _companyNameController,
//   leftIcon: Icon(
//     Icons.home_work_outlined,
//     color: Colors.grey,
//   ),
//   placeholder: 'Company Name',
//   onSubmitInput: () {
//     FocusScope.of(context).nextFocus();
//   },
// ),
// OrganizationInput(
//   controller: _companyCodeController,
//   onSubmitInput: () {
//     FocusManager.instance.primaryFocus?.unfocus();
//     print(_companyCodeController.text);
//   },
// ),
