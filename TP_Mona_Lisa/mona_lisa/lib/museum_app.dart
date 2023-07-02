import 'package:flutter/material.dart';
import 'artwork.dart';

class MuseumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museum',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Artwork(),
      debugShowCheckedModeBanner: false,
    );
  }
}
