import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:chronex/model/user_profile.dart';
import 'package:chronex/presentation/widgets/app_button.dart';
import 'package:chronex/presentation/widgets/app_text_field.dart';
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
  late String name;
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
      backgroundColor: Colors.grey.shade200,
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.sBHh,
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
              10.sBHh,
              Container(
                width: 350.w,
                height: 380.h,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: Text(
                        'Personal Information',
                        style: STextTheme.text22,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        16.sBWw,
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: AppColor.green,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.straighten,
                            color: AppColor.primary,
                          ),
                        ),
                        8.sBWw,
                        Text(
                          'Height(cm)',
                          style: STextTheme.text20.copyWith(
                            color: AppColor.primary,
                          ),
                        ),
                        5.sBWw,
                        SizedBox(
                          width: 95.w,
                          child: AppTextField(
                            controller: _heightController,
                            height: 50.h,
                            keyboardType: TextInputType.number,
                            style: STextTheme.text20,
                          ),
                        ),
                      ],
                    ),
                    10.sBHh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        16.sBWw,
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: AppColor.green,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.monitor_weight_outlined,
                            color: AppColor.primary,
                          ),
                        ),
                        8.sBWw,
                        Text(
                          'weight(kg)',
                          style: STextTheme.text20.copyWith(
                            color: AppColor.primary,
                          ),
                        ),
                        10.sBWw,
                        SizedBox(
                          width: 95.w,
                          child: AppTextField(
                            controller: _weightController,
                            height: 50.h,
                            keyboardType: TextInputType.number,
                            style: STextTheme.text20,
                          ),
                        ),
                      ],
                    ),
                    10.sBHh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        16.sBWw,
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: AppColor.green,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.date_range,
                            color: AppColor.primary,
                          ),
                        ),
                        8.sBWw,
                        Text(
                          'Age',
                          style: STextTheme.text20.copyWith(
                            color: AppColor.primary,
                          ),
                        ),
                        70.sBWw,
                        SizedBox(
                          width: 95.w,
                          child: AppTextField(
                            controller: _ageController,
                            height: 50.h,
                            keyboardType: TextInputType.number,
                            style: STextTheme.text20,
                          ),
                        ),
                      ],
                    ),
                    10.sBHh,
                    if (gender == 'Male')
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          16.sBWw,
                          Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: AppColor.green,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.male,
                              color: AppColor.primary,
                            ),
                          ),
                          8.sBWw,
                          Text(
                            'Gender',
                            style: STextTheme.text20.copyWith(
                              color: AppColor.primary,
                            ),
                          ),
                          39.sBWw,
                          SizedBox(
                            width: 95.w,
                            height: 50.h,
                            child: TextFormField(
                              initialValue: gender,
                              readOnly: true,
                              enabled: false,
                              style: STextTheme.text20,
                              decoration: InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (gender == 'Female')
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          16.sBWw,
                          Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: AppColor.green,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.female,
                              color: AppColor.primary,
                            ),
                          ),
                          8.sBWw,
                          Text(
                            'Gender',
                            style: STextTheme.text20.copyWith(
                              color: AppColor.primary,
                            ),
                          ),
                          12.sBWw,
                          SizedBox(
                            width: 95.w,
                            height: 50.h,
                            child: TextFormField(
                              initialValue: gender,
                              readOnly: true,
                              enabled: false,
                              style: STextTheme.text20,
                              decoration: InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    10.sBHh,
                    Padding(
                      padding: EdgeInsets.only(left: 16.sp),
                      child: AppButton(
                        onPressed: () {
                          // add validator and a snackbar to make sure these values are parseable
                          final newHeight = double.parse(
                            _heightController.text,
                          );
                          final newWeight = double.parse(
                            _weightController.text,
                          );
                          final newAge = int.parse(_ageController.text);
                          bool changed = false;
                          if (profile!.height != newHeight) {
                            profile!.height = newHeight;
                            changed = true;
                          }
                          if (profile!.weight != newWeight) {
                            profile!.weight = newWeight;
                            changed = true;
                          }
                          if (profile!.age != newAge) {
                            profile!.age = newAge;
                            changed = true;
                          }
                          if (changed) {
                            profile!.save();
                          }
                        },
                        title: 'save',
                        titleColor: AppColor.white,
                        color: AppColor.primary,
                        height: 50.h,
                        width: 120.w,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
