import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:chronex/navigation/app_router_path.dart';
import 'package:chronex/presentation/onboard/personal_information_screen.dart';
import 'package:chronex/presentation/provider/home_stats_provider.dart';
import 'package:chronex/presentation/widgets/app_button.dart';
import 'package:chronex/presentation/widgets/app_text_field.dart';
import 'package:chronex/storage/profile_manager.dart';
import 'package:flutter/material.dart';
import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String? name;
  String? gender;
  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profile = await ProfileManager().getProfile();
    if (!mounted) return;
    if (profile != null) {
      setState(() {
        name = profile.name;
        gender = profile.gender;

        _heightController.text = profile.height.toString();
        _weightController.text = profile.weight.toString();
        _ageController.text = profile.age.toString();
      });
    }
  }

  // Future<void> _updateProfile() async {
  //   final profile = await ProfileManager().getProfile();
  //   final newHeight = double.parse(_heightController.text);
  //   final newWeight = double.parse(_weightController.text);
  //   final newAge = int.parse(_ageController.text);
  //   bool changed = false;
  //   if (profile!.height != newHeight) {
  //     profile.height = newHeight;
  //     changed = true;
  //   }
  //   if (profile.weight != newWeight) {
  //     profile.weight = newWeight;
  //     changed = true;
  //   }
  //   if (profile.age != newAge) {
  //     profile.age = newAge;
  //     changed = true;
  //   }
  //   if (changed) {
  //     await ProfileManager().saveProfile(profile);
  //   }
  // }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homePageStatsProvider);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          20.sBHh,
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                buildProfileWidget(bgColor: AppColor.black.withAlpha(100)),
                4.sBHh,
                Text(
                  name ?? 'Runner',
                  style: STextTheme.text24.copyWith(color: AppColor.white, fontWeight: FontWeight.w600),
                ),
                5.sBHh,
                Text(
                  '${state.totalRuns.toString()} runs . ${state.totalDistance.toString()} km total',
                  style: STextTheme.text16.copyWith(color: AppColor.white, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          16.sBHh,
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              spacing: 16.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Personal Information', style: STextTheme.text20),
                0.sBHh,
                buildRow(icon: Icons.straighten, label: 'Height(cm)', controller: _heightController),
                buildRow(icon: Icons.monitor_weight_outlined, label: 'Weight(kg)', controller: _weightController),
                buildRow(icon: Icons.date_range, label: 'Age', controller: _ageController),
                buildRow(
                  icon: Icons.male,
                  label: 'Gender',
                  controller: TextEditingController(text: gender ?? ''),
                  readOonly: true,
                ),
                AppButton(
                  onPressed: () {
                    context.push(AppRouterPath.initial);
                  },
                  title: '    Save    ',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow({required IconData icon, required String label, required TextEditingController controller, bool readOonly = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircularIcons(icon: icon),
        12.sBWw,
        Text(label, style: STextTheme.text16.copyWith(color: AppColor.primary)),
        const Spacer(),
        SizedBox(
          width: 100.w,
          child: AppTextField(controller: controller, readOnly: readOonly),
        ),
      ],
    );
  }
}

class CircularIcons extends StatelessWidget {
  final IconData icon;
  const CircularIcons({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(color: AppColor.green, borderRadius: BorderRadius.circular(50)),
      child: Icon(icon, color: AppColor.primary),
    );
  }
}
