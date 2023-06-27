import 'package:dart_init/01-strings/main.dart' as stringsPackage;
import 'package:dart_init/02-numbers/main.dart' as numbersPackage;
import 'package:dart_init/03-collections/main.dart' as collectionsPackage;
import 'package:dart_init/04-functions/main.dart' as functionsPackage;
import 'package:dart_init/05-poo/main.dart' as pooPackage;
import 'package:dart_init/06-tests/main.dart' as testsPackage;

void main() {
  sectionPrint('--- 01 - Strings ---');
  stringsPackage.main();

  sectionPrint('--- 02 - Numbers ---');
  numbersPackage.main();

  sectionPrint('--- 03 - Collections ---');
  collectionsPackage.main();

  sectionPrint('--- 04 - Functions ---');
  functionsPackage.main();

  sectionPrint('--- 05 - POO ---');
  pooPackage.main();

  sectionPrint('--- 06 - Tests ---');
  testsPackage.main();
}

void sectionPrint(String sectionName) {
  print('');
  print('');
  print(sectionName);
  print('-------------------');
}
