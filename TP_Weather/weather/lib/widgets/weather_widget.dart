import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../services/weather_service.dart';
import 'weather_data_widget.dart';

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
        _weatherData = WeatherService.getWeatherDataByCity(cityName: city);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a city name'),
        ),
      );
    }
  }

  Future<void> _getCurrentLocationWeather() async {
    bool locationServiceEnabled;
    LocationPermission permission;

    locationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!locationServiceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition();

    setState(() {
      _weatherData = WeatherService.getWeatherDataByLocation(
        position.latitude,
        position.longitude,
      );
    });
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
            child: const Text('Get weather data by city'),
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
            onPressed: _getCurrentLocationWeather,
            child: const Text('Get weather data using current location'),
          ),
          const SizedBox(height: 16.0),
          WeatherDataWidget(weatherData: _weatherData),
        ],
      ),
    );
  }
}
