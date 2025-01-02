import 'package:flutter/material.dart';

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
