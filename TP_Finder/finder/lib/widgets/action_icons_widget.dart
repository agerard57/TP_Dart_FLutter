import 'package:flutter/material.dart';

import '../models/display_action_model.dart';
import 'disliked_button_widget.dart';
import 'favorite_button_widget.dart';

class ActionIcons extends StatelessWidget {
  final VoidCallback onDislikePressed;
  final VoidCallback onFavoritePressed;
  final bool isFavorite;
  final DisplayAction displayAction;

  const ActionIcons({
    required this.onDislikePressed,
    required this.onFavoritePressed,
    required this.isFavorite,
    required this.displayAction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (displayAction == DisplayAction.ALL ||
              displayAction == DisplayAction.DISLIKE)
            Expanded(
              child: DislikedButton(onPressed: onDislikePressed),
            ),
          if (displayAction == DisplayAction.ALL ||
              displayAction == DisplayAction.FAVORITE)
            Expanded(
              child: FavoriteButton(
                isFavorite: isFavorite,
                onPressed: onFavoritePressed,
              ),
            ),
        ],
      ),
    );
  }
}
