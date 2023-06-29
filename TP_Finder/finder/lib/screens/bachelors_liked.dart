import 'package:flutter/material.dart';

import '../models/bachelor.dart';

class BachelorsLiked extends StatelessWidget {
  final List<Bachelor> likedBachelors;

  const BachelorsLiked({required this.likedBachelors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Bachelors (${likedBachelors.length})'),
      ),
      body: ListView.builder(
        itemCount: likedBachelors.length,
        itemBuilder: (context, index) {
          final bachelor = likedBachelors[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(bachelor.avatar),
            ),
            title: Text(
              '${bachelor.firstName} ${bachelor.lastName}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            subtitle: Text(
              bachelor.job ?? '',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
