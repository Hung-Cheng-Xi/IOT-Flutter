import 'package:flutter/material.dart';

import 'line_chart/temperature.dart';
import 'line_chart/uv_index.dart';
import 'line_chart/pressure.dart';
import 'line_chart/brightness.dart';

class ChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Charts'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text(
              //   'Weather Charts',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //   textAlign: TextAlign.center,
              // ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('Temperature (°C)'),
                        SizedBox(height: 150, child: WeatherLineChart()),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Text('UV Index'),
                        SizedBox(height: 150, child: WeatherBarChart()),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('Light Intensity'),
                        SizedBox(height: 150, child: WeatherPieChart()),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Text('Pressure (hPa)'),
                        SizedBox(height: 150, child: WeatherLineChart()),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
