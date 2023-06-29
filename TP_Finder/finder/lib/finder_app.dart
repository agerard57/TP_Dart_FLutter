import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'router/app_router.dart';

class FinderApp extends StatefulWidget {
  @override
  _FinderAppState createState() => _FinderAppState();

  static _FinderAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_FinderAppState>();
}

class _FinderAppState extends State<FinderApp> {
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _locale = Locale("en", "US");
  }

  void switchLocale() {
    setState(() {
      _locale = _locale == Locale("en", "US")
          ? Locale("fr", "FR")
          : Locale("en", "US");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Find-a-Bachelor",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
    );
  }
}
