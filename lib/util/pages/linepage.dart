import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LinePage extends StatefulWidget {
  const LinePage();

  @override
  _LinePageState createState() => _LinePageState();
}

class _LinePageState extends State<LinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(enabled: true),
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, 1),
                    FlSpot(1, 1),
                    FlSpot(2, 3),
                    FlSpot(3, 4),
                    FlSpot(3, 5),
                    FlSpot(4, 4)
                  ],
                  isCurved: true,
                  barWidth: 1,
                  colors: [
                    Colors.orange,
                  ],
                  belowBarData: BarAreaData(
                    show: true,
                    colors: [Colors.lightBlue.withOpacity(0.5)],
                    //  cutOffY: cutOffYValue,
                    applyCutOffY: false,
                  ),
                  aboveBarData: BarAreaData(
                    show: true,
                    colors: [Colors.lightGreen.withOpacity(0.5)],
                    //    cutOffY: cutOffYValue,
                    applyCutOffY: false,
                  ),
                  dotData: FlDotData(
                    show: false,
                  ),
                ),
              ],
              minY: 0,
              titlesData: FlTitlesData(
                bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 50,
                    // textStyle: yearTextStyle,
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 0:
                          return '2016';
                        case 1:
                          return '2017';

                        default:
                          return '';
                      }
                    }),
                leftTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    return '\$ ${value + 100}';
                  },
                ),
              ),
              axisTitleData: FlAxisTitleData(
                  leftTitle:
                      AxisTitle(showTitle: true, titleText: 'Value', margin: 1),
                  bottomTitle: AxisTitle(
                      showTitle: true,
                      margin: 1,
                      titleText: 'Year',
                      //  textStyle: yearTextStyle,
                      textAlign: TextAlign.right)),
              gridData: FlGridData(
                show: false,
                checkToShowHorizontalLine: (double value) {
                  return value == 1 || value == 2 || value == 3 || value == 4;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
