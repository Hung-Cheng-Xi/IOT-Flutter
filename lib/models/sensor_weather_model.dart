import 'dart:ffi';

import 'package:flutter/material.dart';

class SensorWeatherModel {
  final String timestamp;
  final double pressure;
  final double temperature;
  final double humidity;
  final double lux;
  final double uv_index;

  SensorWeatherModel({
    required this.timestamp,
    required this.pressure,
    required this.temperature,
    required this.humidity,
    required this.lux,
    required this.uv_index,
  });

  factory SensorWeatherModel.fromJson(Map<String, dynamic> json) {
    return SensorWeatherModel(
      timestamp: json['timestamp'] ?? "未知時間",
      pressure: json['pressure'] ?? "未知",
      temperature: json['temperature'] ?? "未知",
      humidity: json['humidity'] ?? "未知",
      lux: json['lux'] ?? "未知",
      uv_index: json['uv_index'] ?? "未知",
    );
  }
}
