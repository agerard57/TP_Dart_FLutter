import 'package:dart_init/02-numbers/numbers.dart' as numbers;

void main() {
  const int price1 = 1;
  const double price2 = 10.1;
  const String intAsString = '7';

  final scenarios = [
    {'name': '2.1', 'toPrint': '${price1}, ${price2}'},
    {'name': '2.2', 'toPrint': numbers.sum(price1, price2)},
    {'name': '2.3', 'toPrint': numbers.sum(price1, price2).runtimeType},
    {'name': '2.4', 'toPrint': numbers.convertToInt(price1, price2)},
    {'name': '2.5', 'toPrint': numbers.strToInt(intAsString)},
  ];

  for (final scenario in scenarios) {
    print(scenario['name']);
    print(scenario['toPrint']);
    print('--');
  }
}
