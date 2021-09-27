import 'dart:convert';

import 'package:flutter/material.dart';
import '../../components/CustomButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/Services.dart';

class OrganizationScreen extends StatefulWidget {
  OrganizationScreen({Key key}) : super(key: key);
  var t = new Services();

  @override
  _OrganizationScreenState createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  final _companyCodeController = TextEditingController();
  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  static const TextStyle PreSufTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 16,
    height: 0.5,
  );

  void onNextButtonPress() async {
    setState(() {
      loading = true;
    });

    if (_formKey.currentState.validate()) {
      Services s = new Services();
      var checkCompanyCodeResponse =
          await s.verifyDomain(_companyCodeController.text);
      if (checkCompanyCodeResponse != false) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('organizationCode', _companyCodeController.text);
        await prefs.setString(
            'organizationDetails', jsonEncode(checkCompanyCodeResponse));
        Navigator.pushNamed(context, '/SignInScreen');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid Company code')),
        );
      }
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                child: Image.asset(
              'assets/WebHR.png',
              width: 100,
              height: 200,
            )),
            Container(
                child: Image.asset(
              'assets/organizationcode.jpg',
            )),
            Form(
              key: _formKey,
              child: Container(
                height: 400,
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _companyCodeController,
                      decoration: InputDecoration(
                          hintText: "Comapany code",
                          prefixIcon: Container(
                              width: 60,
                              alignment: Alignment.center,
                              child: Text(
                                'https://',
                                style: PreSufTextStyle,
                              )),
                          suffixIcon: Container(
                              width: 60,
                              alignment: Alignment.center,
                              child: Text(
                                '.com',
                                style: PreSufTextStyle,
                              ))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '* Please enter company code';
                        }
                        return null;
                      },
                    ),
                    CustomButton(
                        title: 'Next',
                        loading: loading,
                        color: Color.fromRGBO(12, 100, 174, 1),
                        textColor: Colors.white,
                        onPressCustomButton: () {
                          onNextButtonPress();
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
