import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Map<String, dynamic>> getCityCoordinates(String cityName) async {
  final apiKey = dotenv.env['CITY_API_KEY'];

  try {
    final response = await Dio().get(
      'https://api.api-ninjas.com/v1/city',
      queryParameters: {
        'name': cityName,
      },
      options: Options(
        headers: {
          'X-Api-Key': apiKey,
        },
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data as List<dynamic>;
      if (data.isNotEmpty) {
        final Map<String, dynamic> cityData = data[0] as Map<String, dynamic>;
        final double latitude = cityData['latitude'] as double;
        final double longitude = cityData['longitude'] as double;
        return {'lat': latitude, 'lon': longitude};
      } else {
        throw Exception('City not found');
      }
    } else {
      throw Exception(
          'Error fetching city coordinates: ${response.statusMessage}');
    }
  } catch (e) {
    throw Exception('Error fetching city coordinates: $e');
  }
}
