import 'package:test/test.dart';
import 'package:dart_init/01-strings/strings.dart' as strings;

void main() {
  const String message = 'Hello, World!';
  const String hello = 'Hello';
  const String world = 'World';
  const Map<String, String> pwd = {'valid': 'testPwd123', 'empty': ''};
  const Map<String, String> email = {
    'valid': 'john@doe.com',
    'invalid': 'johndoe.com'
  };

  test('1.1', () {
    expect(strings.helloWorld(), 'Hello, World!');
  });

  test('1.2', () {
    expect(strings.returnMessage(message), 'Hello, World!');
  });

  test('1.3', () {
    expect(strings.interpolation(hello, world), 'Hello, World!');
  });

  test('1.4', () {
    expect(strings.concatenation(hello, world), 'HELLO WORLD');
  });

  test('1.5', () {
    expect(strings.splitMessage(message), 'Hello');
  });

  test('1.6', () {
    expect(strings.getLength(message), 13);
  });

  test('1.7', () {
    expect(strings.leetSpeak(message), 'H3118, W8R1D!');
  });

  test('1.8', () {
    expect(strings.stringToList(message), ['Hello,', 'World!']);
  });

  test('1.9', () {
    expect(strings.passwordMessage(pwd['valid']!), 'Password given');
    expect(strings.passwordMessage(pwd['empty']!), 'Password missing');
  });

  test('1.10', () {
    expect(strings.emailMessage(email['valid']!), 'Valid Email');
    expect(strings.emailMessage(email['invalid']!), 'Invalid Email');
  });
}
