import 'package:finder/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../models/bachelor_model.dart';

AppBar buildHomeAppBar(List<Bachelor> favoriteBachelors, BuildContext context) {
  final favoriteCount = favoriteBachelors.length;

  return AppBar(
    title: Text(AppLocalizations.of(context)!.homePageTitle),
    actions: [
      Tooltip(
        message: AppLocalizations.of(context)!.tooltipFavorites,
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
                  backgroundColor: AppColors['favorite'],
                  child: Text(
                    favoriteCount.toString(),
                    style: TextStyle(fontSize: 12, color: AppColors['white']),
                  ),
                ),
              ),
          ],
        ),
      ),
    ],
  );
}
