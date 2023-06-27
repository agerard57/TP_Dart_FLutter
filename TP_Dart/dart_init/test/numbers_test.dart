import 'package:test/test.dart';
import 'package:dart_init/02-numbers/numbers.dart' as numbers;

void main() {
  const int price1 = 1;
  const double price2 = 10.1;
  const String intAsString = '7';

  test('2.2', () {
    expect(numbers.sum(price1, price2), 11.1);
  });

  test('2.3', () {
    expect(numbers.sum(price1, price2).runtimeType, double);
  });

  test('2.4', () {
    expect(numbers.convertToInt(price1, price2), 11);
  });

  test('2.5', () {
    expect(numbers.strToInt(intAsString), 7);
    expect(numbers.strToInt(intAsString).runtimeType, int);
  });
}
