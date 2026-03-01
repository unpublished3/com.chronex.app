import 'package:chronex/model/user_profile.dart';
import 'package:chronex/storage/hive_manager.dart';

class ProfileManager {
  ProfileManager._();
  static final ProfileManager _instance = ProfileManager._();
  factory ProfileManager() => _instance;

  final HiveManager _hiveManager = HiveManager('profileBox');

  Future<UserProfile?> getProfile() async {
    final data = await _hiveManager.read('user');
    return data as UserProfile?;
  }

  Future<void> saveProfile(UserProfile profile) async {
    await _hiveManager.write('user', profile);
  }
}
