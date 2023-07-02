import 'package:flutter/material.dart';

import 'map_widget.dart';

class WeatherDataWidget extends StatelessWidget {
  final Future<Map<String, dynamic>>? weatherData;

  const WeatherDataWidget({Key? key, required this.weatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: weatherData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final weatherData = snapshot.data!;
          final cityName = weatherData['name'];
          final country = weatherData['sys']['country'];
          final temperature = weatherData['main']['temp'];

          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('City: $cityName, Country: $country'),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.thermostat_outlined),
                    const SizedBox(width: 4.0),
                    Text('$temperature °C'),
                  ],
                ),
                Flexible(
                  child: MapWidget(
                    latitude: snapshot.data!['coord']['lat'] as double,
                    longitude: snapshot.data!['coord']['lon'] as double,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Text('No weather data available');
        }
      },
    );
  }
}
