import 'package:finder/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/bachelor.dart';
import '../screens/bachelor_details.dart';
import 'favorite_button.dart';

class BachelorPreview extends StatelessWidget {
  final Bachelor bachelor;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;
  final Function(Bachelor, bool) onFavoriteStatusChanged;

  const BachelorPreview({
    required this.bachelor,
    required this.isFavorite,
    required this.onFavoritePressed,
    required this.onFavoriteStatusChanged,
  });

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
      trailing: FavoriteButton(
        isFavorite: isFavorite,
        onPressed: () {
          onFavoritePressed();
          showSnackBar(
            context,
            !isFavorite
                ? 'You favorite this bachelor!'
                : 'You unfavorite this bachelor.',
          );
        },
      ),
      onTap: () {
        GoRouter.of(context).go('/bachelor/${bachelor.id}');
      },
    );
  }
}
