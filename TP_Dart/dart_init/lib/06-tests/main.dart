void main() {
  print('6.3');
  dynamic something;

  print(something.runtimeType);

  something = 7;
  print(something.runtimeType);

  something = 'seven';
  print(something.runtimeType);

  assert(something.runtimeType == String, 'Invalid type');
  print('--');
}
