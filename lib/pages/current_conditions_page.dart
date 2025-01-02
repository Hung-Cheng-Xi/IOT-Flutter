import 'package:flutter/material.dart';
import '../models/sensor_weather_model.dart';
import '../api/sensor_weather_api.dart'; // 用於調用 API
import '../widgets/current_conditions.dart';

class CurrentConditionsPage extends StatefulWidget {
  const CurrentConditionsPage({Key? key}) : super(key: key);

  @override
  _CurrentConditionsPageState createState() => _CurrentConditionsPageState();
}

class _CurrentConditionsPageState extends State<CurrentConditionsPage> {
  late Future<List<SensorWeatherModel>> _sensorWeatherData;

  @override
  void initState() {
    super.initState();
    _sensorWeatherData = SensorWeatherService().fetchSensorWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<List<SensorWeatherModel>>(
        future: _sensorWeatherData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available.'));
          } else {
            final weatherData = snapshot.data!;
            return ListView(
              children: [
                ConditionCard(
                  icon: Icons.thermostat,
                  label: "溫度",
                  value: "${weatherData.first.temperature}°C",
                ),
                ConditionCard(
                  icon: Icons.water_drop,
                  label: "濕度",
                  value: "${weatherData.first.humidity}%",
                ),
                ConditionCard(
                  icon: Icons.compress,
                  label: "壓力",
                  value: "${weatherData.first.pressure} hPa",
                ),
                ConditionCard(
                  icon: Icons.wb_sunny,
                  label: "紫外線指數",
                  value: "${weatherData.first.uv_index} (中等)",
                ),
                ConditionCard(
                  icon: Icons.light_mode,
                  label: "光亮度",
                  value: "${weatherData.first.lux} lux",
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
