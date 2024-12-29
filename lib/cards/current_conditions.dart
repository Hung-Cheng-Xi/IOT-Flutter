import 'package:flutter/material.dart';

class CurrentConditionsPage extends StatelessWidget {
  const CurrentConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: const [
          ConditionCard(
            icon: Icons.thermostat,
            label: "溫度",
            value: "25°C",
          ),
          ConditionCard(
            icon: Icons.water_drop,
            label: "濕度",
            value: "65%",
          ),
          ConditionCard(
            icon: Icons.compress,
            label: "壓力",
            value: "1013 hPa",
          ),
          ConditionCard(
            icon: Icons.wb_sunny,
            label: "紫外線指數",
            value: "5 (中等)",
          ),
          ConditionCard(
            icon: Icons.light_mode,
            label: "光亮度",
            value: "800 lux",
          ),
        ],
      ),
    );
  }
}

class ConditionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ConditionCard({
    required this.icon,
    required this.label,
    required this.value,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 32.0, color: Colors.grey),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  value,
                  style: const TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
