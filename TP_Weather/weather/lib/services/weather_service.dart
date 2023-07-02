import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  static Future<Map<String, dynamic>> getWeatherDataByLocation(
    double latitude,
    double longitude,
  ) async {
    final apiKey = dotenv.env['WEATHER_API_KEY'];

    try {
      final response = await Dio().get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'appid': apiKey,
          'units': 'metric',
        },
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception(
            'Error fetching weather data: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching weather data: $e');
    }
  }

  static Future<Map<String, dynamic>> getWeatherDataByCity({
    required String cityName,
  }) async {
    final apiKey = dotenv.env['WEATHER_API_KEY'];

    try {
      final response = await Dio().get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {
          'q': cityName,
          'appid': apiKey,
          'units': 'metric',
        },
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception(
            'Error fetching weather data: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching weather data: $e');
    }
  }
}
