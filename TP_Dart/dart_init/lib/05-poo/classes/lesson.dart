class Lesson {
  String _name;

  Lesson(this._name);

  set name(String value) {
    _name = value;
  }

  @override
  String toString() {
    return 'Lesson{name: $_name}';
  }
}
