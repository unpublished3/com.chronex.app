import 'package:hive/hive.dart';
part 'user_profile.g.dart';

@HiveType(typeId: 0)
class UserProfile extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int age;

  @HiveField(2)
  late double height;

  @HiveField(3)
  late double weight;

  @HiveField(4)
  late String gender;

  UserProfile({
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
    required this.gender,
  });
}
