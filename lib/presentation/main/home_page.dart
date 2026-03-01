import 'package:flutter/material.dart';
import 'package:chronex/storage/profile_manager.dart';
import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:chronex/presentation/widgets/app_button.dart';
import 'package:chronex/presentation/widgets/recent_run_stats.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:chronex/presentation/widgets/home_page_stats.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // provider is yet to be implemented
  int numberofruns = 1;
  double distance = 14.5;
  Duration time = const Duration(hours: 1, minutes: 30);
  Duration pace = const Duration(minutes: 5, seconds: 25);
  DateTime now = DateTime.now();
  String monthname = DateFormat('MMM').format(DateTime.now());
  double recentdistance = 14.5;
  Duration recenttime = const Duration(hours: 1, minutes: 30);
  Duration recentpace = const Duration(minutes: 5, seconds: 25);
  int recentheartbeat = 144;

  late String name;
  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profile = await ProfileManager().getProfile();
    if (profile != null) {
      name = profile.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chronex',
          style: STextTheme.text26.copyWith(color: AppColor.white),
        ),
        titleSpacing: 16.sp,
        backgroundColor: AppColor.primary,
        toolbarHeight: 60.h,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Container(
            width: 360.w,
            height: 180.h,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsetsGeometry.fromLTRB(
                      12.sp,
                      12.sp,
                      0.0,
                      4.sp,
                    ),
                    child: Text(
                      'Welcome Back, $name!',
                      style: STextTheme.text26.copyWith(color: AppColor.white),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(12.sp, 0.0, 0.0, 12.sp),
                    child: Text(
                      'Ready for your next Run?',
                      style: STextTheme.text18.copyWith(color: AppColor.white),
                    ),
                  ),
                ),
                AppButton(
                  onPressed: () {
                    // route to active run track play
                  },
                  title: 'Start New Run',
                  fontSize: 20.0,
                  leadingIcon: const Icon(
                    Icons.play_arrow,
                    color: AppColor.primary,
                    size: 25.0,
                  ),
                  color: Colors.grey.shade100,
                  titleColor: AppColor.primary,
                  width: 320.w,
                  height: 75.h,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(12.h),
              child: Text('Your Stats', style: STextTheme.text24),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomePageStats(
                icon: Icons.directions_run,
                title: 'Total Runs',
                value: numberofruns.toString(),
              ),
              HomePageStats(
                icon: Icons.location_on,
                title: 'Distance',
                value: distance.toStringAsFixed(2),
                unit: 'km',
              ),
            ],
          ),
          25.sBHh,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomePageStats(
                icon: Icons.timer,
                title: 'Total Time',
                value:
                    '${time.inHours.toString().padLeft(2, '0')}:${time.inMinutes.remainder(60).toString().padLeft(2, '0')}',
                unit: 'm',
              ),
              HomePageStats(
                icon: Icons.bolt,
                title: 'Avg Pace',
                value:
                    '${pace.inMinutes.remainder(60).toString().padLeft(2, '0')}:${pace.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                unit: 'm/km',
              ),
            ],
          ),
          25.sBHh,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.sp),
                child: Text('Recent activity', style: STextTheme.text24),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12.sp),
                child: GestureDetector(
                  onTap: () {
                    // move to history page
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10.0),
                    child: Text(
                      'View all',
                      style: STextTheme.text24.copyWith(
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          RecentRunStats(
            monthname: monthname,
            day: now.day,
            year: now.year,
            recentdistance: recentdistance,
            recenttime:
                '${recenttime.inHours.toString().padLeft(2, '0')}:${recenttime.inMinutes.remainder(60).toString().padLeft(2, '0')}',
            recentpace:
                '${recentpace.inMinutes.remainder(60).toString().padLeft(2, '0')}:${recentpace.inSeconds.remainder(60).toString().padLeft(2, '0')}',
            recentheartbeat: recentheartbeat,
          ),
        ],
      ),
    );
  }
}
