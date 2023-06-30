import 'package:flutter/material.dart';

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
        color: Colors.grey,
      ),
      onPressed: onPressed,
    );
  }
}
