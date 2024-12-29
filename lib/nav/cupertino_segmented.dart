import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_iot/widgets/current_conditions.dart';
import '../pages/weekly_weather_page.dart';

enum WeatherView { weekly, current }

Map<WeatherView, String> weatherViews = {
  WeatherView.weekly: "未来一周天氣",
  WeatherView.current: "當前溫濕度",
};

class SegmentedControlComponent extends StatefulWidget {
  const SegmentedControlComponent({super.key});

  @override
  State<SegmentedControlComponent> createState() =>
      _SegmentedControlComponentState();
}

class _SegmentedControlComponentState extends State<SegmentedControlComponent> {
  WeatherView _selectedSegment = WeatherView.weekly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 96),
          child: CupertinoSegmentedControl<WeatherView>(
            groupValue: _selectedSegment,
            onValueChanged: (WeatherView value) {
              setState(() {
                _selectedSegment = value;
              });
            },
            children: {
              WeatherView.weekly: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  weatherViews[WeatherView.weekly]!,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              WeatherView.current: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  weatherViews[WeatherView.current]!,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            },
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildContent() {
    switch (_selectedSegment) {
      case WeatherView.weekly:
        return WeatherDashboard(); // 引用你的 WeatherDashboard
      case WeatherView.current:
        return CurrentConditionsPage(); // 引用你的 CurrentConditionsPage
      default:
        return const Center(child: Text("请选择视图"));
    }
  }
}
