import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../../utils/app_colors.dart';

class LineChart extends StatelessWidget {
  final List chartData;

  LineChart({super.key, required this.chartData});

  // Function to convert the data to the required format
  List<Map<String, dynamic>> _convertChartData() {
    // Ensure the first data point starts at (x = 0, y = 0)
    List<Map<String, dynamic>> convertedData = [
      {"score": 0, "matchName": "Start"}
    ];

    // Add the rest of the data points
    convertedData.addAll(chartData.map((data) {
      int score = int.parse(data["score"]);
      String matchName = data["matchName"];
      return {"score": score, "matchName": matchName};
    }).toList());

    return convertedData;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> convertedChartData = _convertChartData();

    return SizedBox(
      height: 400.h,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            height: 400.h,
            width: 326 + (10 * chartData.length).toDouble(),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              color: const Color(0xff302d2d),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault.r),
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              legend: const Legend(isVisible: true),
              title: const ChartTitle(text: "Scores Ratio"),
              series: [
                SplineSeries<Map<String, dynamic>, String>(
                  dataSource: convertedChartData,
                  xValueMapper: (data, _) => data["matchName"],
                  yValueMapper: (data, _) => data["score"],
                  markerSettings: const MarkerSettings(
                    shape: DataMarkerType.circle,
                    isVisible: true,
                  ),
                  color: Colors.red,
                  name: "Match Score",
                  legendIconType: LegendIconType.circle,
                  dataLabelSettings:  const DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
