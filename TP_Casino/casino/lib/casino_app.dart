import 'package:flutter/material.dart';

import 'one_armed_bandit.dart';

class CasinoApp extends StatelessWidget {
  const CasinoApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One-armed bandit',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const OneArmedBanditPage(),
    );
  }
}
