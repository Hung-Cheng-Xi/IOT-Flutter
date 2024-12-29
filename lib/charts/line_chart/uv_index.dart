import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeatherBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: [
          BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 3, color: Colors.red)]), // 紫外线指数: 3
          BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 5, color: Colors.orange)]),
          BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 2, color: Colors.yellow)]),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 0:
                  return Text('Mon');
                case 1:
                  return Text('Tue');
                case 2:
                  return Text('Wed');
                default:
                  return Text('');
              }
            }),
          ),
        ),
      ),
    );
  }
}
