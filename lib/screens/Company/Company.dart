import 'dart:convert';
import '../../ui_elements/UIElements.dart';
import 'package:fa_stepper/fa_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:webhr_admin/components/CustomButton.dart';
import 'package:webhr_admin/components/Text.dart';

class Company extends StatefulWidget {
  @override
  _CompanyState createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
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

  contentItem() async {
    String jsonString = await _loadJsonAsset();
    final jsonResponse = json.decode(jsonString);

    for (int i = 0; i < jsonResponse.length; i++) {
      for (int j = 0; j < jsonResponse[i]['Data'].length; j++) {
       // print(jsonResponse[i]['Data'][j]['Title']);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    loadVault();
    contentItem();
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
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
                                        continued(data);
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
                          stepNumberColor: Colors.blue.shade800,
                          steps: data.asMap().entries.map<FAStep>((e) {

                            var i = e.key;
                            var todo = e.value;


                        //     for(int j = 0; j<todo['Data'].length; j++){
                        //       print(todo['Data'][j]['Title']);
                        //     }

                            return FAStep(
                              title: _currentStep >= i
                                  ? Textfield(
                                      text: todo['Category'],
                                      style: TextStyle(
                                          color: Colors.blue.shade800),
                                    )
                                  : Textfield(
                                      text: todo['Category'], type: 'Content'),
                              content: UIElements(
data: todo['Data'],
                                name: 'Company Name',
                                type: 'text',
                                value: todo['Data'][0]['Title'],
                                required: true,
                              ),
                              // content: Column(
                              //   children: <Widget>[
                              //     TextFormField(
                              //       decoration: InputDecoration(
                              //           labelText: 'Email Address'),
                              //     ),
                              //     TextFormField(
                              //       decoration:
                              //           InputDecoration(labelText: 'Password'),
                              //     ),
                              //   ],
                              // ),
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

  continued(data) {
    _currentStep < data.length
        ? setState(() {
            if (_currentStep < data.length - 1) {
              _currentStep += 1;
            } else {
              _currentStep = 0;
            }
          })
        : null;
  }

  cancel() {
    _currentStep > 0
        ? setState(() => _currentStep -= 1)
        : setState(() => _currentStep = 0);
  }
}
