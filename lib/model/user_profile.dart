import 'package:hive/hive.dart';
part 'user_profile.g.dart';

@HiveType(typeId: 0)
class UserProfile extends HiveObject {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final int? age;

  @HiveField(2)
  final double? height;

  @HiveField(3)
  final double? weight;

  @HiveField(4)
  final String? gender;

  UserProfile({
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
    required this.gender,
  });
}
