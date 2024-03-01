import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../utils/app_colors.dart';

class LineChart extends StatefulWidget {
  const LineChart({super.key});


  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  List chartData = [
    [2024, 300, 30,120],
    [2025, 200, 200, 85],
    [2026, 400, 200,400],
    [2027, 300, 100,300],
    [2028, 700, 600,800],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SfCartesianChart(
              borderColor: AppColors.primaryColor,
              borderWidth: 1,
              backgroundColor: Color(0xff302d2d),
              legend: Legend(isVisible: true),
              series: [
                SplineSeries(
                  dataSource: chartData,
                  xValueMapper: (data, index) => data[0],
                  yValueMapper: (data, index) => data[1],
                  markerSettings: const MarkerSettings(shape: DataMarkerType.circle),
                  color: const Color(0xff4B91F1),
                  name: "Event 1",
                ),
                SplineSeries(
                  dataSource: chartData,
                  xValueMapper: (data, index) => data[0],
                  yValueMapper: (data, index) => data[2],
                  markerSettings: const MarkerSettings(shape: DataMarkerType.circle),
                  color: const Color(0xffFFFFFF),
                  name: "Match 1",
                ),



                SplineSeries(
                  dataSource: chartData,
                  xValueMapper: (data, index) => data[0],
                  yValueMapper: (data, index) => data[3],
                  markerSettings: const MarkerSettings(shape: DataMarkerType.circle),
                  color: const Color(0xffFA1131),
                  name: "Match 2",
                ),
              ],
            ),
          )
        ],

    );
  }
}
