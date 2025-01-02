import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/sensor_weather_model.dart';

class SensorWeatherService {
  Future<List<SensorWeatherModel>> fetchSensorWeatherData() async {
    try {
      final response = await http.get(
        Uri.parse('http://0.0.0.0:8000/api/weather/sensor/latest'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(utf8.decode(response.bodyBytes));
        return [SensorWeatherModel.fromJson(jsonData)];
        // return jsonData.map((data) => SensorWeatherModel.fromJson(data)).toList();
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
