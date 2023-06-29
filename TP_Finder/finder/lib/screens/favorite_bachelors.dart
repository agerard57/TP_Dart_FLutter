import 'package:flutter/material.dart';

import '../models/bachelor.dart';

class FavoriteBachelors extends StatelessWidget {
  final List<Bachelor> favoriteBachelors;

  const FavoriteBachelors(() param0, {required this.favoriteBachelors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Bachelors (${favoriteBachelors.length})'),
      ),
      body: ListView.builder(
        itemCount: favoriteBachelors.length,
        itemBuilder: (context, index) {
          final bachelor = favoriteBachelors[index];
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
