import 'package:flutter/material.dart';

import 'screens/bachelors_master.dart';

void main() {
  runApp(FinderApp());
}

class FinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finder',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BachelorsMasters(),
    );
  }
}
