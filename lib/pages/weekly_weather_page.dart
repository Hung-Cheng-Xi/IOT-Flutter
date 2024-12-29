import 'package:flutter/material.dart';
import '../api/weekly_weather_api.dart';
import '../models/weekly_weather_model.dart';
import '../widgets/weekly_weather.dart';

class WeatherDashboard extends StatelessWidget {
  const WeatherDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherService = WeatherService();

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Weather Dashboard",
      //     textAlign: TextAlign.start,
      //   ),
      //   toolbarHeight: 100,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<WeatherModel>>(
          future: weatherService.fetchWeatherData(),
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
