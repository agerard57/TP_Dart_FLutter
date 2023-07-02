import 'package:finder/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'data/repository/bachelor_data_manager.dart';
import 'finder_app.dart';
import 'models/bachelor_model.dart';
import 'providers/disliked_bachelors_provider.dart';
import 'providers/favorite_bachelors_provider.dart';

void main() async {
  await Hive
    ..initFlutter()
    ..registerAdapter(GenderAdapter())
    ..registerAdapter(BachelorAdapter());
  await Hive.openBox('bachelors');

  if (Hive.box('bachelors').isEmpty)
    await BachelorDataManager().generateBachelors();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider()),
      ChangeNotifierProvider<FavoriteBachelorsProvider>(
          create: (context) => FavoriteBachelorsProvider()),
      ChangeNotifierProvider<DislikedBachelorsProvider>(
          create: (context) => DislikedBachelorsProvider()),
    ],
    child: FinderApp(),
  ));
}
