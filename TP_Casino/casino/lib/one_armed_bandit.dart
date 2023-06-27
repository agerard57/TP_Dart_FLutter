import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class OneArmedBanditPage extends StatefulWidget {
  const OneArmedBanditPage({Key? key});

  @override
  _OneArmedBanditPageState createState() => _OneArmedBanditPageState();
}

class _OneArmedBanditPageState extends State<OneArmedBanditPage> {
  static const List<String> icons = [
    'seven',
    'cherry',
    'bar',
    'bell',
    'diamond',
    'shoehorse',
    'watermelon',
  ];
  static const List<String> defaultIcons = ['seven', 'seven', 'seven'];

  List<String> currentIcons = List<String>.from(defaultIcons);
  String message = '';
  bool isJackpot = false;
  bool isCountdown = false;
  bool hasEverPlayed = false;
  int countdownValue = 3;
  Timer? countdownTimer;

  void startCountdown() {
    setState(() {
      isCountdown = true;
      message = 'Are you ready?';
    });

    countdownValue = 3;
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countdownValue > 1) {
          countdownValue--;
        } else {
          countdownTimer?.cancel();
          countdownTimer = null;
          isCountdown = false;
          playGame();
        }
      });
    });
  }

  void playGame() {
    setState(() {
      if (hasEverPlayed) currentIcons = List<String>.from(icons);
      isJackpot = false;

      final Random random = Random();
      currentIcons.shuffle(random);

      if (currentIcons.every((icon) => icon == currentIcons[0])) {
        message = 'Jackpot';
        if (currentIcons[0] == 'seven') {
          isJackpot = true;
        }
      } else {
        message = 'You lost, try again!';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    currentIcons = List<String>.from(defaultIcons);
    hasEverPlayed = true;
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('One-armed bandit')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isJackpot)
              const Text(
                'JACKPOT!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < 3; i++)
                  Image.asset(
                    'images/${currentIcons[i]}.png',
                    width: 80,
                    height: 80,
                  ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isCountdown ? null : startCountdown,
              child: const Text('Play'),
            ),
            const SizedBox(height: 20),
            Text(
              isCountdown ? countdownValue.toString() : message,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
