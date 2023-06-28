import 'package:finder/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import '../models/bachelor.dart';
import '../screens/bachelor_details.dart';
import 'like_button.dart';

class BachelorPreview extends StatelessWidget {
  final Bachelor bachelor;
  final bool isLiked;
  final VoidCallback onLikePressed;
  final Function(Bachelor, bool) onLikeStatusChanged;

  const BachelorPreview({
    required this.bachelor,
    required this.isLiked,
    required this.onLikePressed,
    required this.onLikeStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isLiked ? Colors.pink[50] : null;

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
      trailing: LikeButton(
        isLiked: isLiked,
        onPressed: () {
          onLikePressed();
          showSnackBar(
            context,
            !isLiked
                ? 'You liked this bachelor!'
                : 'You unliked this bachelor.',
          );
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              bachelor: bachelor,
              isLiked: isLiked,
              onLikeStatusChanged: onLikeStatusChanged,
            ),
          ),
        );
      },
    );
  }
}
