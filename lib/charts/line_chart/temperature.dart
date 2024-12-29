import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeatherLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
              reservedSize: 22,
              interval: 1,
              getTitlesWidget: (value, meta) {
                return Text('$value');
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
              reservedSize: 22,
              interval: 1,
              getTitlesWidget: (value, meta) {
                return Text('$value');
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 20), // 时间: 0点, 温度: 20°C
              FlSpot(1, 22),
              FlSpot(2, 21),
              FlSpot(3, 23),
              FlSpot(4, 25),
            ],
            isCurved: true,
            color: Colors.blue,
            barWidth: 3,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
