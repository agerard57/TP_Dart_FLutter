import 'package:flutter/material.dart';

import '../services/city_service.dart';
import '../services/weather_service.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  WeatherWidgetState createState() => WeatherWidgetState();
}

class WeatherWidgetState extends State<WeatherWidget> {
  final TextEditingController _cityController = TextEditingController();
  Future<Map<String, dynamic>>? _weatherData;

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    String city = _cityController.text;
    if (city.isNotEmpty) {
      setState(() {
        _weatherData = getCityCoordinates(city).then((coordinates) {
          double? latitude = coordinates['lat'];
          double? longitude = coordinates['lon'];
          if (latitude != null && longitude != null) {
            return getWeatherData(latitude, longitude);
          } else {
            throw Exception('Invalid city coordinates');
          }
        });
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a city name'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _cityController,
            decoration: const InputDecoration(
              labelText: 'City',
              hintText: 'Enter the city name',
              prefixIcon: Icon(Icons.location_city),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              textStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _submitForm,
            child: const Text('Get weather data'),
          ),
          const SizedBox(height: 16.0),
          FutureBuilder<Map<String, dynamic>>(
            future: _weatherData,
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

                return Column(
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
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
