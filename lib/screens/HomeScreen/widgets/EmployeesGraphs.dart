import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/CharData.dart';

class EmployeesGraphs extends StatefulWidget {
  @override
  _EmployeesGraphsState createState() => _EmployeesGraphsState();
}

class _EmployeesGraphsState extends State<EmployeesGraphs> {
  TooltipBehavior _tooltipBehavior;
  final List<ChartData> chartData = [
    ChartData('Employees in Office', 150, Color.fromRGBO(11, 208, 174, 1)),
    ChartData('Employees On Travel', 25, Color.fromRGBO(225, 208, 55, 1)),
    ChartData(
      'Employees On Leave',
      15,
    ),
    ChartData(
      'Absent ',
      5,
    ),
    // ChartData('Absent ', 5, Color.fromRGBO(12, 100, 174, 1)),
  ];

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, color: Colors.blue.shade800);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1.0, color: Colors.black12),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.blue.shade800,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Row(
              children: [
                Text(
                  "Employees",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                )
              ],
            ),
          ),
          Container(
              height: 400,
              child: SfCircularChart(
                  tooltipBehavior: _tooltipBehavior,
                  legend: Legend(isVisible: true),
                  annotations: <CircularChartAnnotation>[
                    CircularChartAnnotation(
                      widget: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('TOALA EMOLOYESS'),
                                const Text(
                                  '180',
                                  style: TextStyle(fontSize: 30),
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                  series: <CircularSeries>[
                    DoughnutSeries<ChartData, String>(
                      dataSource: chartData,
                      pointColorMapper: (ChartData data, _) => data.color,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      // cornerStyle: CornerStyle.endCurve,
                      dataLabelSettings: DataLabelSettings(
                          color: Colors.grey,
                          textStyle: TextStyle(color: Colors.white),
                          isVisible: true,
                          labelPosition: ChartDataLabelPosition.outside),
                      enableTooltip: true,
                      innerRadius: '85%',
                      // explode: true,
                    )
                  ]))
        ],
      ),
    );
  }
}
