import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartPressure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: Colors.blue,
            barWidth: 4,
            spots: [
              FlSpot(0, 1),
              FlSpot(1, 1.5),
              FlSpot(2, 1.4),
              FlSpot(3, 3.4),
              FlSpot(4, 2),
            ],
          ),
        ],
      ),
    );
  }
}
