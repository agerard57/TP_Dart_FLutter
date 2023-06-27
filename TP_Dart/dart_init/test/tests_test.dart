import 'package:test/test.dart';
import 'package:dart_init/02-numbers/numbers.dart' as number;

void main() {
  const int price1 = 1;
  const double price2 = 10.1;

  test('one', () {
    expect(number.sum(price1, price2), 11.1);
  });

  test('two', () {
    expect(() => number.sumFails(), throwsA(TypeMatcher<ArgumentError>()));

    num result = number.sum(price1, price2);
    int expected = 42;

    expect(result == expected, false);

    try {
      if (result != expected) {
        number.sumFails();
      }
    } catch (e) {
      print(e); // Affiche : ArgumentError: Custom argument error
    }
  });

  test('three', () {
    dynamic something;

    expect(something.runtimeType, Null);

    something = 7;
    expect(something.runtimeType, int);

    something = 'seven';
    expect(something.runtimeType, String);
  });
}
