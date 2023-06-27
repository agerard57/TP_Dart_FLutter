import 'package:crypto/crypto.dart';
import 'dart:convert';

class User {
  String firstName;
  String lastName;
  String email;
  late String _hash;

  User(this.firstName, this.lastName, this.email);

  set password(String value) {
    _hash = sha256.convert(utf8.encode(value)).toString();
  }

  bool authenticate(String password) {
    String hashedPassword = sha256.convert(utf8.encode(password)).toString();
    return _hash == hashedPassword;
  }

  @override
  String toString() {
    // Truncated to 10 for the sake of the test
    String maskedPassword =
        _hash.replaceAll(RegExp(r'.'), '*').substring(0, 10);

    return 'User{firstName: $firstName, lastName: $lastName, email: $email, password: $maskedPassword}';
  }

  void sayHello() {
    print('Hello, I\'m $firstName $lastName!');
  }
}
