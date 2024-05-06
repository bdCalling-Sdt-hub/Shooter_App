import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../utils/app_colors.dart';


class LineChart extends StatefulWidget {
  const LineChart({super.key});


  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  List chartData = [
    [2024, 300, 30,120],
    [2025, 200, 200, 85],
    [2026, 400, 300,600],
    [2027, 300, 100,500],
    [2028, 700, 600,800],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            height: 400.h,
            margin : const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
                color: const Color(0xff302d2d),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault.r),
              border: Border.all(color: AppColors.primaryColor)
            ),
            child: SfCartesianChart(
              legend: const Legend(isVisible: true),
              title: const ChartTitle(text: "Scores Ratio"),
              series: [
                SplineSeries(
                  dataSource: chartData,
                  xValueMapper: (data, index) => data[0],
                  yValueMapper: (data, index) => data[1],
                  markerSettings: const MarkerSettings(shape: DataMarkerType.circle),
                  color: const Color(0xff4B91F1),
                  name: "Event 1",
                  legendIconType: LegendIconType.circle,
                ),
                SplineSeries(
                  dataSource: chartData,
                  xValueMapper: (data, index) => data[0],
                  yValueMapper: (data, index) => data[2],
                  markerSettings: const MarkerSettings(shape: DataMarkerType.circle),
                  color: const Color(0xffFFFFFF),
                  name: "Match 1",
                  legendIconType: LegendIconType.circle,
                ),

                SplineSeries(
                  dataSource: chartData,
                  xValueMapper: (data, index) => data[0],
                  yValueMapper: (data, index) => data[3],
                  markerSettings: const MarkerSettings(shape: DataMarkerType.circle),
                  color: const Color(0xffFA1131),
                  name: "Match 2",
                  legendIconType: LegendIconType.circle,
                ),
              ],
            ),
          )
        ],

    );
  }
}
