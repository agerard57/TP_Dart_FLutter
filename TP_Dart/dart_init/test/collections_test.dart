import 'package:test/test.dart';
import 'package:dart_init/03-collections/classes/planet.dart';
import 'package:dart_init/03-collections/classes/solar_system_element.dart';
import 'package:dart_init/03-collections/collections.dart' as collections;
import 'package:dart_init/03-collections/enums/kind.dart';

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

  Map<String, String> apollo = {
    '07_1969': 'Apollo 11',
    '11_1969': 'Apollo 12',
    '02_1971': 'Apollo 14',
    '07_1971': 'Apollo 15',
    '04_1972': 'Apollo 16',
    '12_1972': 'Apollo 17',
  };

  test('3.1', () {
    List<String> sortedPlanets = List<String>.from(planets);
    const List<String> expectedOutput = [
      'Earth',
      'Jupiter',
      'Mars',
      'Mercury',
      'Neptune',
      'Saturn',
      'Uranus',
      'Venus'
    ];

    expect(collections.sortList(sortedPlanets), equals(expectedOutput));
  });

  test('3.2', () {
    List<String> upperCasedPlanets = List<String>.from(planets);
    const List<String> expectedOutput = [
      'EARTH',
      'MARS',
      'MERCURY',
      'SATURN',
      'VENUS',
      'NEPTUNE',
      'URANUS',
      'JUPITER'
    ];

    expect(
        collections.uppercaseList(upperCasedPlanets), equals(expectedOutput));
  });

  test('3.3', () {
    List<String> firstLetterPlanets = List<String>.from(planets);
    const List<String> expectedOutput = [
      'E',
      'M',
      'M',
      'S',
      'V',
      'N',
      'U',
      'J'
    ];

    expect(collections.fistLettersList(firstLetterPlanets),
        equals(expectedOutput));
  });

  test('3.4', () {
    List<String> formattedPlanets = List<String>.from(planets);
    const List<String> expectedOutput = [
      '1 - Earth',
      '2 - Mars',
      '3 - Mercury',
      '4 - Saturn',
      '5 - Venus',
      '6 - Neptune',
      '7 - Uranus',
      '8 - Jupiter'
    ];

    expect(collections.formatList(formattedPlanets), equals(expectedOutput));
  });

  test('3.5', () {
    List<String> planetsWithoutEndingWithVowels = List<String>.from(planets);
    const List<String> expectedOutput = [
      'Earth',
      'Mars',
      'Saturn',
      'Venus',
      'Uranus',
      'Jupiter'
    ];

    expect(collections.removeEndingWithVowels(planetsWithoutEndingWithVowels),
        equals(expectedOutput));
  });

  test('3.6', () {
    List<String> planetsWithPluto = List<String>.from(planets);

    const String newPlanet = 'Pluto';
    const List<String> expectedOutput = [...planets, 'Pluto'];

    expect(collections.addNewPlanet(planetsWithPluto, newPlanet),
        equals(expectedOutput));
  });

  test('3.7', () {
    Planet mercury = Planet('Mercury', 91.69);
    Planet saturn = Planet('Saturn', 1275);
    Planet neptune = Planet('Neptune', 4351.40);
    Planet jupiter = Planet('Jupiter', 628.73);
    Planet mars = Planet('Mars', 78.34);
    Planet venus = Planet('Venus', 41.40);
    Planet uranus = Planet('Uranus', 2723.95);

    List<Planet> instantiatedPlanets = [
      mercury,
      saturn,
      neptune,
      jupiter,
      mars,
      venus,
      uranus
    ];
    List<Planet> expectedOutput = [
      venus,
      mars,
      mercury,
      jupiter,
      saturn,
      uranus,
      neptune,
    ];

    expect(collections.sortByDistance(instantiatedPlanets),
        equals(expectedOutput));
  });

  test('3.8', () {
    expect(collections.returnSingleValue(apollo, '07_1969'), 'Apollo 11');
    expect(collections.returnSingleValue(apollo, '3630'), 'No value found');
    expect(collections.returnAllKeys(apollo),
        ['07_1969', '11_1969', '02_1971', '07_1971', '04_1972', '12_1972']);
    expect(collections.returnAllValues(apollo), [
      'Apollo 11',
      'Apollo 12',
      'Apollo 14',
      'Apollo 15',
      'Apollo 16',
      'Apollo 17'
    ]);
  });

  test('3.9', () {
    expect(
        collections.editEntry(
            apollo, '07_1969', 'Neil Armstrong + Buzz Aldrin'),
        equals({
          ...apollo,
          '07_1969': 'Neil Armstrong + Buzz Aldrin',
        }));
  });

  test('3.10', () {
    List<SolarSystemElement> elements = [
      SolarSystemElement('sun', Kind.STAR),
      SolarSystemElement('earth', Kind.PLANET),
      SolarSystemElement('moon', Kind.SATELLITE),
      SolarSystemElement('pluton', Kind.SATELLITE)
    ];

    expect(
        collections.sortToKind(elements),
        equals({
          Kind.STAR: ['sun'],
          Kind.PLANET: ['earth'],
          Kind.SATELLITE: ['moon', 'pluton']
        }));
  });
}
