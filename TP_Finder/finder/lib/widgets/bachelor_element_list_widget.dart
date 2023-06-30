import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/display_action_model.dart';
import '../providers/disliked_bachelors_provider.dart';
import '../providers/favorite_bachelors_provider.dart';
import '../models/bachelor_model.dart';
import 'action_icons_widget.dart';

class BachelorElementList extends StatelessWidget {
  final Bachelor bachelor;
  final bool isFavorite;

  const BachelorElementList({
    required this.bachelor,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isFavorite ? Colors.pink[50] : null;

    return Consumer2<FavoriteBachelorsProvider, DislikedBachelorsProvider>(
        builder:
            (context, favoriteBachelorsProvider, dislikedBachelorsProvider, _) {
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
        trailing: ActionIcons(
            onDislikePressed: () =>
                dislikedBachelorsProvider.toggleDisliked(bachelor, context),
            onFavoritePressed: () =>
                favoriteBachelorsProvider.toggleFavorite(bachelor, context),
            isFavorite: isFavorite,
            displayAction: DisplayAction.ALL),
        onTap: () {
          GoRouter.of(context).go('/bachelor/${bachelor.id}');
        },
      );
    });
  }
}
