import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Weather>> fetchWeather() async {
  final response = await http
      .get(Uri.parse('http://0.0.0.0:8000/api/weather/week-weather/'));

  if (response.statusCode == 200) {
    final List<dynamic> weatherData = jsonDecode(response.body);
    return weatherData
        .map((json) => Weather.fromJson(json as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception('Failed to load weather data');
  }
}

class Weather {
  final String day;
  final String startTime;
  final String endTime;
  final String weather;
  final int temperature;
  final String description;
  final String icon;
  final String humidity;
  final String maxComfortIndex;
  final String minFeelsLikeTemp;
  final String maxFeelsLikeTemp;

  const Weather({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.weather,
    required this.temperature,
    required this.description,
    required this.icon,
    required this.humidity,
    required this.maxComfortIndex,
    required this.minFeelsLikeTemp,
    required this.maxFeelsLikeTemp,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      day: json['day'] as String,
      startTime: json['StartTime'] as String,
      endTime: json['EndTime'] as String,
      weather: json['Weather'] as String,
      temperature: json['Temperature'] as int,
      description: json['description'] as String,
      icon: json['icon'] as String,
      humidity: json['humidity'] as String,
      maxComfortIndex: json['maxComfortIndex'] as String,
      minFeelsLikeTemp: json['minFeelsLikeTemp'] as String,
      maxFeelsLikeTemp: json['maxFeelsLikeTemp'] as String,
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Weather>> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weekly Weather Forecast'),
        ),
        body: Center(
          child: FutureBuilder<List<Weather>>(
            future: futureWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final weatherList = snapshot.data!;
                return ListView.builder(
                  itemCount: weatherList.length,
                  itemBuilder: (context, index) {
                    final weather = weatherList[index];
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(Icons.wb_sunny), // Change this to match icon from API if necessary
                        title: Text('${weather.day} - ${weather.weather}'),
                        subtitle: Text(
                          '${weather.description}\nTemperature: ${weather.temperature}°C\nFeels like: ${weather.minFeelsLikeTemp}°C - ${weather.maxFeelsLikeTemp}°C\nHumidity: ${weather.humidity}',
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
