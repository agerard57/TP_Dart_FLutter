import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/bachelor_details.dart';
import '../screens/bachelors_master.dart';
import '../screens/favorite_bachelors.dart';

class AppRouter {
  const AppRouter._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => BachelorsMasters(),
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
      return Text('Error Page : ${state.error}');
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
