import 'package:flutter/material.dart';

import '../widgets/weather_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: WeatherWidget(),
      ),
    );
  }
}
