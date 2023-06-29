enum Gender {
  male,
  female,
}

class Bachelor {
  final int id;
  final String firstName;
  final String lastName;
  final Gender gender;
  final String avatar;
  List<Gender> searchFor;
  String? job;
  String? description;

  Bachelor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.avatar,
    this.searchFor = const [],
    this.job,
    this.description,
  });
}
