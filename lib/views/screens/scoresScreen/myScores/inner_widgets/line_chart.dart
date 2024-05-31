import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../../utils/app_colors.dart';

class LineChart extends StatelessWidget {
  final List chartData;

  LineChart({super.key, required this.chartData});

  List<Map<String, dynamic>> _convertChartData() {
    List<Map<String, dynamic>> convertedData = [
      {'score': 0, 'matchName': '', 'matchDate': ''}
    ];

    convertedData.addAll(chartData.map((data) {
      int score = int.parse(data["score"]);
      String matchDate = data["matchDate"];
      String matchName = data["matchName"];
      return {"score": score, "matchName": matchName, "matchDate": matchDate};
    }).toList());

    return convertedData;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> convertedChartData = _convertChartData();

    return SizedBox(
      height: 550.h,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        //scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: Get.width.w,
            alignment: Alignment.center,
            child: convertedChartData.length == 1
                ? const Center(child: CustomText(text: 'No data found!'))
                : Container(
                    height: 440.h,
                    width: 326 + (10 * chartData.length).toDouble(),
                    // margin: EdgeInsets.symmetric(horizontal: 4.w),
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: const Color(0xff302d2d),
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault.r),
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    child:

                        /*SfCartesianChart(
                primaryXAxis: const CategoryAxis(
                  initialVisibleMinimum: 0.0,
                  labelPosition: ChartDataLabelPosition.inside,
                  title: AxisTitle(text: "Match Date"),
                ),
                primaryYAxis: const NumericAxis(
                  initialVisibleMinimum: 0.0,
                  title: AxisTitle(text: "Score"),
                ),
                legend: const Legend(isVisible: true),
                title: const ChartTitle(text: "Scores Ratio"),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: [
                  SplineSeries<Map<String, dynamic>, String>(
                    initialIsVisible: true,
                    isVisibleInLegend: true,
                    dataSource: convertedChartData,
                    xValueMapper: (data, _) {
                      final matchDate = data["matchDate"];
                      if (matchDate != null && matchDate.isNotEmpty) {
                        final dateTime = DateFormat("yyyy-MM-dd").parse(matchDate);
                        return DateFormat("MM-dd-yyyy").format(dateTime);
                      } else {
                        return null;
                      }
                    },
                    yValueMapper: (data, _) => data["score"],
                    markerSettings: const MarkerSettings(
                      shape: DataMarkerType.circle,
                      isVisible: true,
                    ),
                    color: Colors.red,
                    name: "Match Score",
                    legendIconType: LegendIconType.circle,
                    dataLabelSettings: const DataLabelSettings(isVisible: true, showZeroValue: true),
                    enableTooltip: true,
                    dataLabelMapper: (data, _) => data["matchName"],
                  ),
                ],
              )*/

                        SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          // width: MediaQuery.of(context).size.width * 1.5,
                          child: SfCartesianChart(

                            primaryXAxis: const CategoryAxis(
                              initialVisibleMinimum: 0.0,
                              labelPosition: ChartDataLabelPosition.inside,
                              title: AxisTitle(text: "Match Name"),
                            ),
                            primaryYAxis: const NumericAxis(
                              initialVisibleMinimum: 0.0,
                              title: AxisTitle(text: "Score"),
                            ),
                            legend: const Legend(isVisible: true),
                            title: const ChartTitle(text: "Scores Ratio"),
                            tooltipBehavior: TooltipBehavior(enable: true),
                            series: [
                              SplineSeries<Map<String, dynamic>, String>(
                                initialIsVisible: true,
                                isVisibleInLegend: true,
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
                                dataLabelSettings: const DataLabelSettings(
                                    isVisible: true, showZeroValue: true),
                                enableTooltip: true,
                                dataLabelMapper: (data, _) {
                                  final matchDate = data["matchDate"];
                                  if (matchDate != null &&
                                      matchDate.isNotEmpty) {
                                    final dateTime = DateFormat("yyyy-MM-dd")
                                        .parse(matchDate);
                                    return DateFormat("MM-dd-yyyy")
                                        .format(dateTime);
                                  } else {
                                    return null;
                                  }
                                },
                                // (data, _) => data["matchDate"],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
