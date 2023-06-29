import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'finder_app.dart';
import 'data/bachelor_data_manager.dart';
import 'models/bachelor_model.dart';
import 'providers/bachelor_app_provider.dart';

void main() async {
  await Hive
    ..initFlutter()
    ..registerAdapter(GenderAdapter())
    ..registerAdapter(BachelorAdapter());
  await Hive.openBox('bachelors');

  if (Hive.box('bachelors').isEmpty)
    await BachelorDataManager().generateBachelors();

  runApp(
    ChangeNotifierProvider(
      create: (context) => BachelorAppProvider(),
      child: FinderApp(),
    ),
  );
}
