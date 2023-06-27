import 'classes/lesson.dart';
import 'classes/student.dart';
import 'classes/user.dart';

void main() {
  User johnDoe = User('John', 'Doe', 'john@doe.com');
  johnDoe.password = 'testPwd123';

  print('5.4');
  print(johnDoe.toString());
  print('--');

  print('5.6');
  johnDoe.sayHello();
  print('--');

  print('5.7');
  print(johnDoe.authenticate('testPwd123'));
  print('--');

  print('5.10');
  Student janeDoe = Student('Jane', 'Doe');
  Lesson italian = Lesson('Italian');

  janeDoe.addLesson(italian);

  print(janeDoe);

  Lesson french = Lesson('French');
  janeDoe.addLesson(french);

  print(janeDoe);

  janeDoe.removeLesson(italian);

  print(janeDoe);
  print('--');
}
