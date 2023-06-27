import 'package:flutter/material.dart';

import 'fruit.dart';

class FruitApp extends StatelessWidget {
  const FruitApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apples, Pears and Pineapples',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const FruitHomePage(title: 'Fruit List Home Page'),
    );
  }
}
