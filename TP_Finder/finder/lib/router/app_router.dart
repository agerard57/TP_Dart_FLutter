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
        builder: (context, state) {
          final id = state.params['id'];
          if (id != null) {
            BachelorDetails(id: id),
          } else {
            Text('Error: No ID provided');
          }

          return BachelorDetails(id: state.params['id']),
        }, 
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
