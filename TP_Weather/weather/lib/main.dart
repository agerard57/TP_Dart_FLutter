import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'weather_app.dart';

void main() async {
  await dotenv.load();
  runApp(const WeatherApp());
}
