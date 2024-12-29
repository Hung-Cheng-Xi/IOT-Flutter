import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeatherPieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(value: 40, color: Colors.yellow, title: 'Morning'),
          PieChartSectionData(value: 30, color: Colors.orange, title: 'Afternoon'),
          PieChartSectionData(value: 20, color: Colors.red, title: 'Evening'),
          PieChartSectionData(value: 10, color: Colors.blue, title: 'Night'),
        ],
      ),
    );
  }
}
