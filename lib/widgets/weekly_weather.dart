import 'package:flutter/material.dart';

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
