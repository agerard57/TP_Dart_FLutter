import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar buildAppBar(List<Bachelor> favoriteBachelors, BuildContext context) {
  final favoriteCount = favoriteBachelors.length;

  return AppBar(
    title: Text('Home'),
    actions: [
      Tooltip(
        message: 'View favorite',
        child: Stack(
          children: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                GoRouter.of(context).go('/favorites');
              },
            ),
            if (favoriteCount > 0)
              Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Text(
                    favoriteCount.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ],
  );
}
