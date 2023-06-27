import 'lesson.dart';

class Student {
  String _firstName;
  String _lastName;
  final List<Lesson> _lessons = [];

  Student(this._firstName, this._lastName);

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  set lastName(String value) {
    _lastName = value;
  }

  List<Lesson> get lessons => _lessons;

  void addLesson(Lesson lesson) {
    _lessons.add(lesson);
  }

  void removeLesson(Lesson lesson) {
    _lessons.remove(lesson);
  }

  @override
  String toString() {
    String lessonsString =
        _lessons.isNotEmpty ? _lessons.join(', ') : 'No lessons';

    return 'Student{firstName: $_firstName, lastName: $_lastName, lessons: $lessonsString}';
  }
}
