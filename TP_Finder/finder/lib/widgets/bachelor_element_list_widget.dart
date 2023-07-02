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
  final bool enableSwipeToDelete;

  const BachelorElementList({
    required this.bachelor,
    required this.isFavorite,
    required this.enableSwipeToDelete,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isFavorite ? Colors.pink[50] : null;

    Widget content = ListTile(
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
            Provider.of<DislikedBachelorsProvider>(context, listen: false)
                .toggleDisliked(bachelor, context),
        onFavoritePressed: () =>
            Provider.of<FavoriteBachelorsProvider>(context, listen: false)
                .toggleFavorite(bachelor, context),
        isFavorite: isFavorite,
        displayAction: DisplayAction.ALL,
      ),
      onTap: () {
        GoRouter.of(context).go('/bachelor/${bachelor.id}');
      },
    );

    if (enableSwipeToDelete) {
      content = Dismissible(
        key: Key(bachelor.id.toString()),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            Provider.of<FavoriteBachelorsProvider>(context, listen: false)
                .toggleFavorite(bachelor, context, forceDelete: true);
          }
        },
        background: Container(
          color: Colors.red,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.favorite_border_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
        child: content,
      );
    }

    return content;
  }
}
