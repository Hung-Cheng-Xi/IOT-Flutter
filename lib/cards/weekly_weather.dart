import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherDashboard extends StatelessWidget {
  const WeatherDashboard({Key? key}) : super(key: key);

  Future<List<WeatherModel>> fetchWeatherData() async {
    try {
      final response = await http.get(
        Uri.parse('http://0.0.0.0:8000/api/weather/week-weather/'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(utf8.decode(response.bodyBytes));
        return jsonData.map((data) => WeatherModel.fromJson(data)).toList();
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<WeatherModel>>(
          future: fetchWeatherData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No weather data available"));
            }

            final weatherData = snapshot.data!;
            return ListView.builder(
              itemCount: weatherData.length,
              itemBuilder: (context, index) {
                final data = weatherData[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: WeatherCard(
                    day: data.day,
                    icon: data.icon,
                    condition: data.weather,
                    rainChance: data.rainChance,
                    temperature:
                        "${data.minFeelsLikeTemp}°C - ${data.maxFeelsLikeTemp}°C",
                    comfort: data.comfort,
                    humidity: data.humidity,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// WeatherModel 用於解析 API 資料
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

  /// 將 String 轉換為 IconData
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
        return Icons.error; // 預設的錯誤圖標
    }
  }
}

// 天氣卡片的顯示元件
class WeatherCard extends StatelessWidget {
  final String day;
  final IconData icon;
  final String condition;
  final String rainChance;
  final String temperature;
  final String comfort;
  final String humidity;

  const WeatherCard({
    required this.day,
    required this.icon,
    required this.condition,
    required this.rainChance,
    required this.temperature,
    required this.comfort,
    required this.humidity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoSans',
              ),
            ),
            const Divider(),
            Row(
              children: [
                Icon(icon, size: 32.0, color: Colors.grey),
                const SizedBox(width: 8.0),
                Text(
                  condition,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSans',
                  ),
                ),
              ],
            ),
            const Divider(),
            Text("降雨機率：$rainChance",
                style: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'NotoSans',
                )),
            Text("溫度：$temperature",
                style: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'NotoSans',
                )),
            Text("舒適度：$comfort",
                style: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'NotoSans',
                )),
            Text("濕度：$humidity",
                style: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'NotoSans',
                )),
          ],
        ),
      ),
    );
  }
}
