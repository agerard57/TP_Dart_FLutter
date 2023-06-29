import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../screens/bachelor_details_screen.dart';
import '../screens/bachelors_home_screen.dart';
import '../screens/favorite_bachelors_screen.dart';

class AppRouter {
  const AppRouter._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => BachelorsHome(),
      ),
      GoRoute(
        path: '/bachelor/:id',
        builder: _buildBachelorDetailsRoute,
      ),
      GoRoute(
        path: '/favorites',
        builder: (context, state) => FavoriteBachelors(),
      ),
    ],
    errorBuilder: (context, state) {
      return Text(
        AppLocalizations.of(context)!.errorPage(state.error.toString()),
      );
    },
  );
}

Widget _buildBachelorDetailsRoute(BuildContext context, GoRouterState state) {
  final idParam = state.pathParameters['id'];
  int? id;

  if (idParam != null) {
    id = int.tryParse(idParam);
  }

  if (id != null) {
    return BachelorDetails(id: id);
  } else {
    return Text('Error: Invalid ID provided');
  }
}
