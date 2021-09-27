import 'dart:convert';

import 'package:fa_stepper/fa_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:webhr_admin/components/CustomButton.dart';
import 'package:webhr_admin/components/Text.dart';

class Station extends StatefulWidget {
  @override
  _StationState createState() => _StationState();
}

class _StationState extends State<Station> {
  final GlobalKey<FormState> _formKeyOtp = GlobalKey<FormState>();
  var data;
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

  Future<String> _loadJsonAsset() async {
    return await rootBundle.loadString('assets/newCompany.json');
  }

  Future loadVault() async {
    String jsonString = await _loadJsonAsset();
    final jsonResponse = json.decode(jsonString);
    setState(() {
      data = jsonResponse;
    });
  }

  Future loadTitle() async {
    List<String> check = [];
    List<String> check2 = [];
    String jsonString = await _loadJsonAsset();
    final jsonResponse = json.decode(jsonString);
    print(jsonResponse);
    for (int i = 0; i < jsonResponse['Data'].length; i++) {
      print(jsonResponse['Data'][i]['Category']);
      //check.add(jsonResponse[i]['title']);
      //check2.add(jsonResponse[i]['color']);
    }
    // setState(() {
    //   graphTitle = check;
    //   graphColor = check2;
    // });
  }

  @override
  void initState() {
    super.initState();
    loadVault();
    loadTitle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Colors.black,
              ),
              tooltip: 'Back Button',
              onPressed: () {
                Get.offAllNamed("/HomeScreen");
              },
            ),
            Textfield(
              text: 'New Company',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: SvgPicture.asset(
                  'assets/svg/NewCompany.svg',
                  width: 220.0,
                  height: 220.0,
                  // color: HexColor('#0C64AE'),
                )),
            Expanded(
                child: Container(
                    color: Colors.white,
                    child: Theme(
                        data: ThemeData(
                            canvasColor: Colors.white,
                            colorScheme: ColorScheme.light(
                                primary: Colors.blue.shade800)),
                        child: FAStepper(
                            controlsBuilder: (BuildContext context,
                                {VoidCallback onStepContinue,
                                VoidCallback onStepCancel}) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: TextButton(
                                                child: Text(
                                                  'BACK',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color:
                                                          Colors.grey.shade500),
                                                ),
                                                onPressed: () {
                                                  cancel();
                                                }))),
                                  ),
                                  Container(
                                    child: CustomButton(
                                        title: 'NEXT',
                                        //loading: loading,
                                        customWidth: 150,
                                        color: Color.fromRGBO(12, 100, 174, 1),
                                        textColor: Colors.white,
                                        onPressCustomButton: () {
                                          continued();
                                        }),
                                  ),
                                ],
                              );
                            },
                            type: FAStepperType.horizontal,
//physics: NeverScrollableScrollPhysics(),
                            //  physics: ClampingScrollPhysics(),
//                          physics: BouncingScrollPhysics(),
                            currentStep: _currentStep,
                            onStepTapped: (step) => tapped(step),
                            //onStepContinue: continued,
                            //onStepCancel: cancel,
                            // steps: <FAStep>[
                            //   data.map<FAStep>((e) {
                            //     //var i = e.key;
                            //     //var todo = e.value;
                            //     return FAStep(title: Textfield(
                            //               text: e['Category'], type: 'Content'),
                            //         content: Text('Done'));
                            //   }).toList(),
                            //
                            // ]
                           // steps: _getSteps(data)
                            steps: data.asMap().entries.map<FAStep>((e) {
                              var i = e.key;
                              var todo = e.value;
                              return FAStep(
                                title: Textfield(
                                    text: todo['Category'], type: 'Content'),
                                content: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'Email Address'),
                                    ),
                                    TextFormField(
                                      decoration:
                                      InputDecoration(labelText: 'Password'),
                                    ),
                                  ],
                                ),
                                isActive: _currentStep >= i,
                                // state: _currentStep >= i
                                //     ? StepState.complete
                                //     : StepState.disabled,
                              );
                            }).toList(),
                            )))),
          ],
        ),
      ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 4 ? setState(() => _currentStep += 1) : null;
  }

  List<FAStep> _getSteps(data) {

    return <FAStep>[

        FAStep(
          title: const Text('Hello111'),
          content: const Text('This is Content1'),
        ) ,


      FAStep(
        title: const Text('Hello222'),
        content: const Text('This is Content2'),
      ),
      FAStep(
        title: const Text('Hello333'),
        content: const Text('This is Content3'),
      ),
      FAStep(
        title: const Text('Hello4444'),
        content: const Text('This is Content4'),
      ),
      FAStep(
        title: const Text('Hello555'),
        content: const Text('This is Content555'),
      ),
      FAStep(
        title: const Text('Hel666'),
        content: const Text('This is Content666'),
      ),
      FAStep(
        title: const Text('Hello111'),
        content: const Text('This is Content1'),
      ),
      FAStep(
        title: const Text('Hello111'),
        content: const Text('This is Content1'),
      ),
      FAStep(
        title: const Text('Hello111'),
        content: const Text('This is Content1'),
      ),
      FAStep(
        title: const Text('Hello111'),
        content: const Text('This is Content1'),
      ),
    ];
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
