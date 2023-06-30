import 'package:flutter/material.dart';

Widget EmptyMessage(BuildContext context, String message) {
  return Center(
    child: Text(
      message,
      style: TextStyle(fontSize: 16),
    ),
  );
}
