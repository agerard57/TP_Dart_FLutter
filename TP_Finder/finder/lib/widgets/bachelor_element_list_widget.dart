import 'package:finder/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
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
    final dislikedBachelorsProvider =
        Provider.of<DislikedBachelorsProvider>(context, listen: false);
    final favoriteBachelorsProvider =
        Provider.of<FavoriteBachelorsProvider>(context, listen: false);
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    final backgroundColor = isFavorite
        ? themeProvider.isDarkModeEnabled
            ? AppColors['favoriteBackgroundDark']
            : AppColors['favoriteBackgroundLight']
        : null;
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
          color: AppColors['grey'],
          fontSize: 14.0,
        ),
      ),
      trailing: ActionIcons(
        onDislikePressed: () =>
            dislikedBachelorsProvider.toggleDisliked(bachelor, context),
        onFavoritePressed: () =>
            favoriteBachelorsProvider.toggleFavorite(bachelor, context),
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
            favoriteBachelorsProvider.toggleFavorite(
              bachelor,
              context,
            );
          }
        },
        background: Container(
          color: AppColors['favorite'],
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.favorite_border_rounded,
                color: AppColors['white'],
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
