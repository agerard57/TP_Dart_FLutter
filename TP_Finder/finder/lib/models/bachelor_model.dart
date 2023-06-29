import 'package:hive/hive.dart';

part 'bachelor_model.g.dart';

@HiveType(typeId: 1)
enum Gender {
  @HiveField(0)
  MALE,
  @HiveField(1)
  FEMALE,
}

@HiveType(typeId: 0)
class Bachelor extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String firstName;

  @HiveField(2)
  final String lastName;

  @HiveField(3)
  final Gender gender;

  @HiveField(4)
  final String avatar;

  @HiveField(5)
  List<Gender> searchFor;

  @HiveField(6)
  String? job;

  @HiveField(7)
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

  String get fullName => '$firstName $lastName';
}
