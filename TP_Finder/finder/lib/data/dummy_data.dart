import 'package:faker/faker.dart';

import '../models/bachelor.dart';

List<Bachelor> generateFakeBachelors() {
  final List<Bachelor> bachelors = [];
  final faker = Faker();

  for (int i = 0; i < 30; i++) {
    final fullName = faker.person.name();

    final firstName = fullName.split(' ')[0];
    final lastName = fullName.split(' ')[1];
    final gender = i < 15 ? Gender.male : Gender.female;
    final avatar = gender == Gender.male
        ? 'images/man-${i + 1}.png'
        : 'images/woman-${i - 14}.png';
    final job = faker.job.title();
    final description = faker.lorem.sentences(3).join(' ');

    final bachelor = Bachelor(
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      avatar: avatar,
      searchFor: [],
      job: job,
      description: description,
    );

    bachelors.add(bachelor);
  }

  return bachelors;
}
