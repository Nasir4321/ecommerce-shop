import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../components/CustomButton.dart';
import 'package:get/get.dart';

class StartUpScreen extends StatefulWidget {
  StartUpScreen({Key key}) : super(key: key);

  @override
  _StartUpScreenState createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  int _currentPageIndex = 0;

  List<String> moduleInfo = [
    'assets/one.png',
    'assets/two.png',
    'assets/three.png'
  ];

  void onSingInButtonPress() {
    Navigator.pushNamed(context, '/OrganizationScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 200,
                child: Image.asset(
                  'assets/WebHR.png',
                  width: 100,
                )),
            Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      aspectRatio:
                          MediaQuery.of(context).size.width > 480 ? 1.3 : 1,
                      autoPlayInterval: Duration(seconds: 3),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentPageIndex = index;
                        });
                      }),
                  items: moduleInfo.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          child: Image.asset(
                            i,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: moduleInfo.map((url) {
                    int index = moduleInfo.indexOf(url);
                    return Container(
                      width: 30,
                      height: _currentPageIndex == index ? 8 : 5,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _currentPageIndex == index
                            ? Color.fromRGBO(2, 100, 174, 1)
                            : Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            Column(
              children: [
                CustomButton(
                    title: 'Sign In',
                    color: Color.fromRGBO(12, 100, 174, 1),
                    textColor: Colors.white,
                    onPressCustomButton: () {
                      Get.toNamed('/OrganizationScreen');
                      // Navigator.pushNamed(context, '/OrganizationScreen');
                    }),
                Stack(
                  children: [
                    Container(
                      height: 1,
                      margin: EdgeInsets.only(top: 20.0, bottom: 12),
                      color: Colors.grey.shade300,
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 12.0),
                        width: 170,
                        color: Colors.white,
                        child: Text(
                          "Haven't Registered Yet?",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                CustomButton(
                    title: 'Create Account',
                    color: Color.fromRGBO(63, 61, 83, 1),
                    textColor: Colors.white,
                    onPressCustomButton: () {
                      Navigator.pushNamed(context, '/PricingScreen');
                    })
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
