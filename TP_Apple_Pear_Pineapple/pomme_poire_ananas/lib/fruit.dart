import 'package:flutter/material.dart';

class FruitApp extends StatelessWidget {
  const FruitApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apples, Pears and Pineapples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FruitHomePage(title: 'Fruit List Home Page'),
    );
  }
}

class FruitHomePage extends StatefulWidget {
  const FruitHomePage({Key? key, required this.title});

  final String title;

  @override
  State<FruitHomePage> createState() => _FruitHomePageState();
}

class _FruitHomePageState extends State<FruitHomePage> {
  List<int> fruits = [];
  int _fruitCount = 0;

  bool isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  void _incrementFruitCount() {
    setState(() {
      _fruitCount++;
      fruits.add(_fruitCount);
    });
  }

  String getItemType(int number) {
    if (isPrime(number)) {
      return 'Prime';
    } else if (number % 2 == 0) {
      return 'Even';
    } else {
      return 'Odd';
    }
  }

  Widget getItemImage(int number) {
    if (isPrime(number)) {
      return Image.asset('images/pineapple.png');
    } else if (number % 2 == 0) {
      return Image.asset('images/pear.png');
    } else {
      return Image.asset('images/apple.png');
    }
  }

  Color getItemBackgroundColor(int number) {
    if (number % 2 == 0) {
      return Colors.cyan;
    } else {
      return Colors.indigo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('$_fruitCount -> ${getItemType(_fruitCount)}'),
      ),
      body: ListView.builder(
        itemCount: _fruitCount,
        itemBuilder: (BuildContext context, int index) {
          final number = fruits[index];
          return Container(
            color: getItemBackgroundColor(number),
            child: ListTile(
              leading: getItemImage(number),
              title: Text(
                'Fruit $number',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementFruitCount,
        tooltip: 'Add Fruit',
        child: const Icon(Icons.add),
      ),
    );
  }
}
