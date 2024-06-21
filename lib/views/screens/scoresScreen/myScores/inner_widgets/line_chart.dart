import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shooter_app/model/events_model.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../../controller/scores_controller.dart';
import '../../../../../utils/app_colors.dart';

class LineChart extends StatefulWidget {
  final List chartData;
  LineChart({super.key, required this.chartData});

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  EventsModel? _selectedItem;
  final ScoresController _scoresController = Get.put(ScoresController());

  List<Map<String, dynamic>> _convertChartData() {
    List<Map<String, dynamic>> convertedData = [
      {'score': 0, 'matchName': '', 'matchDate': ''}
    ];

    convertedData.addAll(widget.chartData.map((data) {
      int score = int.parse(data["score"]);
      String matchDate = data["matchDate"];
      String matchName = data["matchName"];
      return {"score": score, "matchName": matchName, "matchDate": matchDate};
    }).toList());

    return convertedData;
  }

  @override
  void initState() {
    _scoresController.getEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> convertedChartData = _convertChartData();

    return SizedBox(
      height: 550.h,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          //=====================================>  Line Chart Container <==================================
          Container(
            width: Get.width.w,
            alignment: Alignment.center,
            child: convertedChartData.length == 1
                ? const Center(child: CustomText(text: 'No data found!'))
                : Container(
                    height: 440.h,
                    width: 326 + (10 * widget.chartData.length).toDouble(),
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: const Color(0xff302d2d),
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault.r),
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
<<<<<<< HEAD
                          width: MediaQuery.of(context).size.width * 1.5,
=======
                           width: 326 + (40 * chartData.length).toDouble(),
                            // width: MediaQuery.of(context).size.width * 1.5,
>>>>>>> 6ae3f81353fd61bcad742b9cff797c4abf0cb696
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem _dropdownMenuItem(value) {
    return DropdownMenuItem(
      value: value,
      child: CustomText(
        text: value['eventName'] ?? "",
      ),
    );
  }
}
