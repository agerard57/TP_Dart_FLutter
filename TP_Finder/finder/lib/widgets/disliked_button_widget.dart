import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class DislikedButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DislikedButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.thumb_down_outlined,
        color: AppColors['grey'],
      ),
      onPressed: onPressed,
    );
  }
}
