import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        height: 250,
        width: double.infinity,
        child: FadeInUp(
          duration: const Duration(milliseconds: 1300),
          child: LineChart(
            mainData(),
            swapAnimationDuration: const Duration(milliseconds: 800),
            swapAnimationCurve: Curves.linear,
          ),
        ),
      ),
    );
  }

  List<Color> gradientColors = [kGradientColorOne, kGradientColorTwo];

  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
          show: true,
          horizontalInterval: 1.6,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              dashArray: const [3, 3],
              color: kGradientColorOne.withOpacity(0.2),
              strokeWidth: 2,
            );
          },
          drawVerticalLine: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => TextStyle(
              color: kTextColor, fontWeight: FontWeight.bold, fontSize: 10),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'Sun';
              case 2:
                return 'Mon';
              case 4:
                return 'Tue';
              case 6:
                return 'Wed';
              case 8:
                return 'Thu';
              case 10:
                return 'Fri';
              case 12:
                return 'Sat';
            }
            return '';
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 25,
          margin: 12,
        ),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(0, 3),
            const FlSpot(2.4, 2),
            const FlSpot(4.4, 3),
            const FlSpot(6.4, 3.1),
            const FlSpot(8, 4),
            const FlSpot(9.5, 4),
            const FlSpot(11, 5),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradientFrom: const Offset(0, 0),
            gradientTo: const Offset(0, 1),
            colors: [
              kGradientColorTwo.withOpacity(0.2),
              kGradientColorTwo.withOpacity(0.1),
            ],
          ),
        ),
      ],
    );
  }
}
