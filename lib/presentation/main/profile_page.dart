import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:chronex/model/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Box<UserProfile> box;
  UserProfile? profile;
  String name = 'Harry';
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  late TextEditingController _ageController;
  late String gender;
  @override
  void initState() {
    super.initState();
    box = Hive.box<UserProfile>('profileBox');
    profile = box.get('user');
    if (profile != null) {
      name = profile!.name;
      gender = profile!.gender;
      _heightController = TextEditingController(
        text: profile!.height.toString().trim(),
      );
      _weightController = TextEditingController(
        text: profile!.weight.toString().trim(),
      );
      _ageController = TextEditingController(
        text: profile!.age.toString().trim(),
      );
    } else {
      _heightController = TextEditingController();
      _weightController = TextEditingController();
      _ageController = TextEditingController();
    }
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
          child: Text(
            'Chronex',
            style: STextTheme.text26.copyWith(color: AppColor.white),
          ),
        ),
        backgroundColor: AppColor.primary,
        toolbarHeight: 60.h,
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 350.w,
              height: 220.h,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  10.sBHh,
                  Container(
                    width: 90.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      color: AppColor.green.withAlpha(50),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: AppColor.white,
                      size: 50,
                    ),
                  ),
                  Text(
                    name,
                    style: STextTheme.text36.copyWith(color: AppColor.white),
                  ),
                  5.sBHh,
                  Text(
                    '1 runs . 0.0 km total',
                    style: STextTheme.text24.copyWith(color: AppColor.white),
                  ), // change later
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
