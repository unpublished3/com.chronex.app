import 'package:chronex/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:chronex/presentation/widgets/app_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final _formGlobalKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String? gender;
  List<String> genderOption = ['Male', 'Female', 'Other'];
  @override
  void dispose() {
    _nameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 350.w,
            height: 625.h,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Form(
              key: _formGlobalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 90.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: AppColor.white,
                      size: 50,
                    ),
                  ),
                  Text('Personal Information', style: STextTheme.text30),
                  Text(
                    'Help us personalize your experience',
                    style: STextTheme.text18,
                  ),
                  SizedBox(
                    width: 300.w,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Name', style: STextTheme.text20),
                        ),
                        5.sBHh,
                        AppTextField(
                          keyboardType: TextInputType.name,
                          labelText: 'Enter your name',
                          height: 50.0,
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 120.w,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Height (cm)',
                                style: STextTheme.text20,
                              ),
                            ),
                            5.sBHh,
                            AppTextField(
                              controller: _heightController,
                              height: 50.0,
                              labelText: 'Height',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 120.w,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Weight (kg)',
                                style: STextTheme.text20,
                              ),
                            ),
                            5.sBHh,
                            AppTextField(
                              controller: _weightController,
                              height: 50.0,
                              labelText: 'Weight',
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 120.w,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Age', style: STextTheme.text20),
                            ),
                            5.sBHh,
                            AppTextField(
                              controller: _ageController,
                              height: 50.0,
                              labelText: 'Age',
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 120.w,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Gender', style: STextTheme.text20),
                            ),
                            5.sBHh,
                            DropdownButtonFormField<String>(
                              items: genderOption.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  gender = value?.trim();
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppButton(
                    onPressed: () {
                      _formGlobalKey.currentState!.validate();
                      var box = Hive.box('Profile');
                      Hive.openBox('Profile');
                      box.put('name', _nameController.text.trim());
                      box.put(
                        'age',
                        int.tryParse(_ageController.text.trim()) ?? 0,
                      );
                      box.put(
                        'height',
                        double.tryParse(_heightController.text.trim()) ?? 0.0,
                      );
                      box.put(
                        'weight',
                        double.tryParse(_weightController.text.trim()) ?? 0.0,
                      );
                      box.put('gender', gender!);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Profile saved sucessfully!',
                            textAlign: TextAlign.center,
                          ),
                          duration: Duration(seconds: 2),
                        ),
                        // Route to onboard_page
                      );
                    },
                    title: 'Continue',
                    titleColor: AppColor.white,
                    fontSize: 20.0,
                    color: AppColor.primary,
                    height: 50.h,
                    width: 300.w,
                    borderRadius: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
