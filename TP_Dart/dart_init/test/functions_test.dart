import 'package:test/test.dart';
import 'package:dart_init/04-functions/enums/ft.dart';
import 'package:dart_init/04-functions/functions.dart' as functions;

void main() {
  test('4.1', () {
    expect(functions.sayHello('World'), 'Hello, World!');
  });

  test('4.2', () {
    expect(functions.sum(3600, 30), 3630);
  });

  test('4.3', () {
    expect(functions.sumMany([1000, 200, 30, 4]), 1234);
  });

  test('4.5', () {
    expect(functions.sumAndFormat(3600, 30), 3630);
    expect(functions.sumAndFormat(3600, 30, ft: Ft.int).runtimeType, int);
    expect(functions.sumAndFormat(3600, 30, ft: Ft.double).runtimeType, double);
  });

  test('4.6', () {
    String hello = 'Hello';

    expect(functions.strReverse(hello), 'olleH');
  });
}
