import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/DashboardHeader.dart';
import '../../components/QuickNotification.dart';
import '../../components/AddCategory.dart';
import '../../components/EmployeeGraph.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic data;
  List<String> title = [
    'Complete mandatory fields',
    'Verify your phone number',
    'Please add your picture',
    'Please your nick name',
    'Please change your password',
    'Please change your picture'
  ];
  List<String> employeeType = [
    'Employees by Attendance',
    'Employees by Gender',
    'Employees by Categories',
    'Employees by Types'
  ];

  List<String> categoryTitle = [
    'Add Company',
    'Add Station',
    'Add Department',
    'Add Employee',
    'Add Branch'
  ];
  List<String> categoryImage = [
    'assets/svg/AddCompany.svg',
    'assets/svg/AddStation.svg',
    'assets/svg/AddDepartment.svg',
    'assets/svg/AddEmployee.svg',
    'assets/svg/AddBranch.svg',
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 120,
            backgroundColor: Colors.white,
            title: DashboardHeader(
                name: 'Nasir Abbasi',
                image: null,
                searchOnPress: () {
                  print('Search');
                },
                syncOnPress: () {
                  print('Sync');
                })),
        body: Container(
          child: ListView(shrinkWrap: true, children: [
            Container(

             // height: 120,
              child: QuickNotification(
                itemNumber: title.length,
                title: title,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: 170,
                margin: EdgeInsets.only(top: 20),
                child: AddCategory(
                  itemNumber: categoryTitle.length,
                  title: categoryTitle,
                  imageUri: categoryImage,
                ),
              ),
            ),
            EmployeeGraph(employeeType: employeeType)
          ]),
        ));
  }
}
