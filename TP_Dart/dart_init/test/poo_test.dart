import 'package:dart_init/05-poo/classes/lesson.dart';
import 'package:dart_init/05-poo/classes/student.dart';
import 'package:dart_init/05-poo/classes/user.dart';
import 'package:test/test.dart';

void main() {
  User johnDoe = User('John', 'Doe', 'john@doe.com');
  johnDoe.password = 'testPwd123';

  test('5.4', () {
    expect(johnDoe.toString(),
        'User{firstName: John, lastName: Doe, email: john@doe.com, password: **********}');
  });

  test('5.7', () {
    expect(johnDoe.authenticate('testPwd123'), true);
    expect(johnDoe.authenticate('testPwd1234'), false);
  });

  test('5.10', () {
    Student johnDoe = Student('John', 'Doe');
    Lesson italian = Lesson('Italian');

    johnDoe.addLesson(italian);

    print(johnDoe);

    Lesson french = Lesson('French');
    johnDoe.addLesson(french);

    print(johnDoe);

    johnDoe.removeLesson(italian);

    print(johnDoe);
  });
}
