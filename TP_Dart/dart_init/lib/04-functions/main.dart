import 'package:dart_init/04-functions/functions.dart' as functions;

void main() {
  String hello = 'Hello';

  format('2.1', functions.sayHello('World'));
  format('2.2', functions.sum(3600, 30));
  format('2.3', functions.sumMany([1000, 200, 30, 4]));
  print('2.4');
  functions.sumAndPrint(3600, 30, shouldPrint: true);
  print('--');
  format('2.5', functions.strReverse(hello));
  format('2.6', functions.sumAndFormat(3600, 30));
  print('2.7');
  functions.fibonacci(17);
  print('--');
}

void format(String name, dynamic toPrint) {
  print(name);
  print(toPrint);
  print('--');
}
