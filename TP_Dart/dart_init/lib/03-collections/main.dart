import 'package:dart_init/03-collections/collections.dart' as collections;

import 'classes/planet.dart';
import 'classes/solar_system_element.dart';
import 'enums/kind.dart';

void main() {
  const List<String> planets = [
    'Earth',
    'Mars',
    'Mercury',
    'Saturn',
    'Venus',
    'Neptune',
    'Uranus',
    'Jupiter'
  ];

  List<String> sortedPlanets = List<String>.from(planets);
  List<String> upperCasedPlanets = List<String>.from(planets);
  List<String> firstLetterPlanets = List<String>.from(planets);
  List<String> formattedPlanets = List<String>.from(planets);
  List<String> planetsWithoutEndingWithVowels = List<String>.from(planets);
  List<String> planetsWithPluto = List<String>.from(planets);

  Map<String, String> apollo = {
    '07_1969': 'Apollo 11',
    '11_1969': 'Apollo 12',
    '02_1971': 'Apollo 14',
    '07_1971': 'Apollo 15',
    '04_1972': 'Apollo 16',
    '12_1972': 'Apollo 17',
  };

  List<Planet> instantiatedPlanets = [
    Planet('Mercury', 91.69),
    Planet('Saturn', 1275),
    Planet('Neptune', 4351.40),
    Planet('Jupiter', 628.73),
    Planet('Mars', 78.34),
    Planet('Venus', 41.40),
    Planet('Uranus', 2723.95),
  ];

  List<SolarSystemElement> elements = [
    SolarSystemElement('sun', Kind.star),
    SolarSystemElement('earth', Kind.planet),
    SolarSystemElement('moon', Kind.satellite),
    SolarSystemElement('pluton', Kind.satellite)
  ];

  final scenarios = [
    {'name': '2.1', 'toPrint': collections.sortList(sortedPlanets)},
    {'name': '2.2', 'toPrint': collections.uppercaseList(upperCasedPlanets)},
    {'name': '2.3', 'toPrint': collections.fistLettersList(firstLetterPlanets)},
    {'name': '2.4', 'toPrint': collections.formatList(formattedPlanets)},
    {
      'name': '2.5',
      'toPrint':
          collections.removeEndingWithVowels(planetsWithoutEndingWithVowels)
    },
    {
      'name': '2.6',
      'toPrint': collections.addNewPlanet(planetsWithPluto, 'Pluto')
    },
    {
      'name': '2.7',
      'toPrint': collections
          .sortByDistance(instantiatedPlanets)
          .map((planet) => planet.name)
          .join(', ')
    },
    {'name': '2.8.1', 'toPrint': apollo.values.join(', ')},
    {
      'name': '2.8.2.1',
      'toPrint': collections.returnSingleValue(apollo, '07_1969')
    },
    {
      'name': '2.8.2.2',
      'toPrint': collections.returnSingleValue(apollo, '3630')
    },
    {'name': '2.8.3', 'toPrint': collections.returnAllKeys(apollo).join(', ')},
    {
      'name': '2.8.4',
      'toPrint': collections.returnAllValues(apollo).join(', ')
    },
    {
      'name': '2.9',
      // See test for better understanding
      'toPrint': collections.editEntry(
          apollo, '07_1969', 'Neil Armstrong + Buzz Aldrin')
    },
    {
      'name': '2.10',
      // See test for better understanding
      'toPrint': collections.sortToKind(elements)
    },
  ];

  for (final scenario in scenarios) {
    print(scenario['name']);
    print(scenario['toPrint']);
    print('--');
  }
}
