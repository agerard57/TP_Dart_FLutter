import 'package:dart_init/01-strings/strings.dart' as string;

void main() {
  const String message = 'Hello, World!';
  const String hello = 'Hello';
  const String world = 'World';
  const Map<String, String> pwd = {'valid': 'testPwd123', 'empty': ''};
  const Map<String, String> email = {
    'valid': 'john@doe.com',
    'invalid': 'johndoe.com'
  };

  final scenarios = [
    {'name': '1.1', 'toPrint': string.helloWorld()},
    {'name': '1.2', 'toPrint': string.returnMessage(message)},
    {'name': '1.3', 'toPrint': string.interpolation(hello, world)},
    {'name': '1.4', 'toPrint': string.concatenation(hello, world)},
    {'name': '1.5', 'toPrint': string.splitMessage(message)},
    {'name': '1.6', 'toPrint': string.getLength(message)},
    {'name': '1.7', 'toPrint': string.leetSpeak(message)},
    {'name': '1.8', 'toPrint': string.stringToList(message)},
    {'name': '1.9.1', 'toPrint': string.passwordMessage(pwd['valid']!)},
    {'name': '1.9.2', 'toPrint': string.passwordMessage(pwd['empty']!)},
    {'name': '1.10.1', 'toPrint': string.emailMessage(email['valid']!)},
    {'name': '1.10.2', 'toPrint': string.emailMessage(email['invalid']!)},
  ];

  for (final scenario in scenarios) {
    print(scenario['name']);
    print(scenario['toPrint']);
    print('--');
  }
}
