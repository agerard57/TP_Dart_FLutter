import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/bachelor_model.dart';
import 'favorite_button_widget.dart';

class BachelorPreview extends StatelessWidget {
  final Bachelor bachelor;
  final bool isFavorite;

  const BachelorPreview({
    required this.bachelor,
    required this.isFavorite,
  });

  get bachelorAppProvider => null;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isFavorite ? Colors.pink[50] : null;

    return ListTile(
      tileColor: backgroundColor,
      leading: Hero(
        tag: bachelor.avatar,
        child: CircleAvatar(
          backgroundImage: AssetImage(bachelor.avatar),
        ),
      ),
      title: Text(
        bachelor.fullName,
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
      trailing: FavoriteButton(
        isFavorite: isFavorite,
        onPressed: () => bachelorAppProvider.toggleFavorite(bachelor, context),
      ),
      onTap: () {
        GoRouter.of(context).go('/bachelor/${bachelor.id}');
      },
    );
  }
}
