import 'package:finder/providers/provider.dart';
import 'package:finder/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteBachelorsProvider(),
      child: FinderApp(),
    ),
  );
}

class FinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Finder',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
    );
  }
}
