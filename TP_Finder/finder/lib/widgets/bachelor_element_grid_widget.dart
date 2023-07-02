import 'package:finder/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/display_action_model.dart';
import '../providers/disliked_bachelors_provider.dart';
import '../providers/favorite_bachelors_provider.dart';
import '../models/bachelor_model.dart';
import '../providers/theme_provider.dart';
import 'action_icons_widget.dart';

class BachelorElementGrid extends StatelessWidget {
  final Bachelor bachelor;
  final bool isFavorite;

  const BachelorElementGrid({
    required this.bachelor,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer3<ThemeProvider, FavoriteBachelorsProvider,
        DislikedBachelorsProvider>(
      builder: (context, themeProvider, favoriteBachelorsProvider,
          dislikedBachelorsProvider, _) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).go('/bachelor/${bachelor.id}');
          },
          child: Container(
            decoration: BoxDecoration(
              color: isFavorite
                  ? themeProvider.isDarkModeEnabled
                      ? AppColors['favoriteBackgroundDark']
                      : AppColors['favoriteBackgroundLight']
                  : null,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16.0),
                Expanded(
                  child: Hero(
                    tag: bachelor.avatar,
                    child: CircleAvatar(
                      radius: 400,
                      backgroundImage: AssetImage(bachelor.avatar),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  bachelor.fullName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  bachelor.job ?? '',
                  style: TextStyle(
                    color: AppColors['grey'],
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 8.0),
                ActionIcons(
                  onDislikePressed: () => dislikedBachelorsProvider
                      .toggleDisliked(bachelor, context),
                  onFavoritePressed: () => favoriteBachelorsProvider
                      .toggleFavorite(bachelor, context),
                  isFavorite: isFavorite,
                  displayAction: DisplayAction.ALL,
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
