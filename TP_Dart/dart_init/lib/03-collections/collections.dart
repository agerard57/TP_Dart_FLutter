import 'classes/planet.dart';
import 'classes/solar_system_element.dart';
import 'enums/kind.dart';

List<String> sortList(List<String> list) {
  list.sort();

  return list;
}

List<String> uppercaseList(List<String> list) {
  return list.map((e) => e.toUpperCase()).toList();
}

List<String> fistLettersList(List<String> planets) {
  List<String> firstLetters = [];
  int i = 0;

  while (i < planets.length) {
    firstLetters.add(planets[i][0]);
    i++;
  }

  return firstLetters;
}

List<String> formatList(List<String> planets) {
  List<String> result = [];
  int index = 0;
  do {
    result.add('${index + 1} - ${planets[index]}');
    index++;
  } while (index < planets.length);

  return result;
}

List<String> removeEndingWithVowels(List<String> planets) {
  List<String> result = [];
  int index = 0;

  while (index < planets.length) {
    List<String> vowels = ['a', 'e', 'i', 'o', 'u', 'y'];
    String planet = planets[index];
    String lastLetter = planet.substring(planet.length - 1).toLowerCase();
    if (!vowels.contains(lastLetter)) {
      result.add(planet);
    }
    index++;
  }

  return result;
}

List<String> addNewPlanet(List<String> planets, String newPlanet) {
  planets.add(newPlanet);

  return planets;
}

List<Planet> sortByDistance(List<Planet> planets) {
  planets.sort((a, b) => a.distanceFromEarth.compareTo(b.distanceFromEarth));

  return planets;
}

String returnSingleValue(Map<String, String> apollo, String key) {
  if (apollo.containsKey(key)) {
    return apollo[key]!;
  } else {
    return 'No value found';
  }
}

List<String> returnAllKeys(Map<String, String> apollo) {
  return apollo.keys.toList();
}

List<String> returnAllValues(Map<String, String> apollo) {
  return apollo.values.toList();
}

Map<String, String> editEntry(
    Map<String, String> apollo, String keyToChange, String newValue) {
  if (apollo.containsKey(keyToChange)) {
    apollo[keyToChange] = newValue;
  }

  return apollo;
}

Map<Kind, List<String>> sortToKind(List<SolarSystemElement> elements) {
  Map<Kind, List<String>> result = {};

  for (SolarSystemElement element in elements) {
    if (result.containsKey(element.kind)) {
      result[element.kind]!.add(element.name);
    } else {
      result[element.kind] = [element.name];
    }
  }

  return result;
}
