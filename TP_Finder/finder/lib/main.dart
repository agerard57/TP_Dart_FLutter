import 'package:finder/data/bachelor_data_manager.dart';
import 'package:finder/models/bachelor_model.dart';
import 'package:finder/providers/bachelor_app_provider.dart';
import 'package:finder/router/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

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

class FinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
    );
  }
}
