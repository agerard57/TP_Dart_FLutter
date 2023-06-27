import 'package:dart_init/05-poo/classes/user.dart';

class Admin extends User {
  int _grade = 1;

  Admin(String firstName, String lastName, String email)
      : super(firstName, lastName, email);

  int get grade => _grade;

  set grade(int value) {
    _grade = value;
  }
}
