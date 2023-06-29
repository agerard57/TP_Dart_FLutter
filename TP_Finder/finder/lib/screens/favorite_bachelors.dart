import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/bachelor.dart';
import '../providers/provider.dart';

class FavoriteBachelors extends StatelessWidget {
  late final List<Bachelor> favoriteBachelors;

  @override
  Widget build(BuildContext context) {
    favoriteBachelors =
        Provider.of<BachelorAppProvider>(context).favoriteBachelors;

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
