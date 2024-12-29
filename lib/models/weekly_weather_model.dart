import 'package:flutter/material.dart';

class WeatherModel {
  final String day;
  final IconData icon;
  final String weather;
  final String rainChance;
  final String minFeelsLikeTemp;
  final String maxFeelsLikeTemp;
  final String humidity;
  final String comfort;

  WeatherModel({
    required this.day,
    required this.icon,
    required this.weather,
    required this.rainChance,
    required this.minFeelsLikeTemp,
    required this.maxFeelsLikeTemp,
    required this.humidity,
    required this.comfort,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      day: json['day'] ?? "未知日期",
      icon: _getIconData(json['icon'] ?? "Icons.error"),
      weather: json['Weather'] ?? "未知天氣狀況",
      rainChance: json['description'] ?? "未知",
      comfort: json['maxComfortIndex'] ?? "未知",
      minFeelsLikeTemp: json['minFeelsLikeTemp'] ?? "未知",
      maxFeelsLikeTemp: json['maxFeelsLikeTemp'] ?? "未知",
      humidity: json['humidity'] ?? "未知",
    );
  }

  static IconData _getIconData(String iconName) {
    switch (iconName) {
      case "Icons.cloud":
        return Icons.cloud;
      case "Icons.rain":
        return Icons.umbrella;
      case "Icons.cloud_queue":
        return Icons.cloud_queue;
      case "Icons.wb_cloudy":
        return Icons.wb_cloudy;
      case "Icons.wb_sunny":
        return Icons.wb_sunny;
      default:
        return Icons.error;
    }
  }
}
