import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'screens/home_screen.dart';

void main() async {
  await dotenv.load();
  runApp(const WeatherApp());
}