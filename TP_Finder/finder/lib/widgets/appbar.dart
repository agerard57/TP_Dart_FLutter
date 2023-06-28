import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';

import '../screens/bachelors_liked.dart';

AppBar buildAppBar(List<Bachelor> likedBachelors, BuildContext context) {
  final likedCount = likedBachelors.length;

  return AppBar(
    title: Text('Home'),
    actions: [
      Tooltip(
        message: 'View liked',
        child: Stack(
          children: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LikedBachelorsScreen(
                      likedBachelors: likedBachelors,
                    ),
                  ),
                );
              },
            ),
            if (likedCount > 0)
              Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Text(
                    likedCount.toString(),
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
