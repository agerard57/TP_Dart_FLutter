String helloWorld() {
  return 'Hello, World!';
}

String returnMessage(String message) {
  return message;
}

String interpolation(String hello, String world) {
  return '$hello, $world!';
}

String concatenation(String hello, String world) {
  return '${hello.toUpperCase()} ${world.toUpperCase()}';
}

String splitMessage(String message) {
  return message.split(', ')[0];
}

int getLength(String message) {
  return message.length;
}

String leetSpeak(String message) {
  String modifiedString = '';

  for (int i = 0; i < message.length; i++) {
    String currentChar = message[i].toUpperCase();

    if (currentChar == 'O') {
      modifiedString += '8';
    } else if (currentChar == 'L') {
      modifiedString += '1';
    } else if (currentChar == 'E') {
      modifiedString += '3';
    } else {
      modifiedString += currentChar;
    }
  }

  return modifiedString;
}

List<String> stringToList(String welcome) {
  return welcome.split(' ');
}

String passwordMessage(String pwd) {
  return pwd.isEmpty ? 'Password missing' : 'Password given';
}

String emailMessage(String email) {
  bool isValid = email.contains('@') && email.contains('.');

  return isValid ? 'Valid Email' : 'Invalid Email';
}
