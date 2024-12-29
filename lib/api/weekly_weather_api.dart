import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weekly_weather_model.dart';

class WeatherService {
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
}
