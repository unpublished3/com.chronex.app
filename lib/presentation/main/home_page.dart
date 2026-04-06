import 'package:chronex/presentation/provider/home_stats_provider.dart';
import 'package:chronex/presentation/provider/recent_runs_provider.dart';
import 'package:flutter/material.dart';
import 'package:chronex/storage/profile_manager.dart';
import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:chronex/presentation/widgets/app_button.dart';
import 'package:chronex/presentation/widgets/recent_run_stats.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:chronex/presentation/widgets/home_page_stats.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String? name;

  @override
  void initState() {
    super.initState();
    _loadProfile();
    ref.read(recentRunsProvider.notifier).getRecentRuns();
  }

  Future<void> _loadProfile() async {
    final profile = await ProfileManager().getProfile();
    if (profile != null) {
      name = profile.name;
    } else {
      name = 'Runner';
    }
  }

  @override
  Widget build(BuildContext context) {
    final stats = ref.watch(homePageStatsProvider);
    final runs = ref.watch(recentRunsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chronex', style: STextTheme.text26.copyWith(color: AppColor.white)),
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
            decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsetsGeometry.fromLTRB(12.sp, 12.sp, 0.0, 4.sp),
                    child: Text('Welcome Back, $name!', style: STextTheme.text26.copyWith(color: AppColor.white)),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(12.sp, 0.0, 0.0, 12.sp),
                    child: Text('Ready for your next Run?', style: STextTheme.text18.copyWith(color: AppColor.white)),
                  ),
                ),
                AppButton(
                  onPressed: () {
                    // route to active run track play
                  },
                  title: 'Start New Run',
                  fontSize: 20.0,
                  leadingIcon: const Icon(Icons.play_arrow, color: AppColor.primary, size: 25.0),
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
              HomePageStats(icon: Icons.directions_run, title: 'Total Runs', value: stats.totalRuns.toString()),
              HomePageStats(icon: Icons.location_on, title: 'Distance', value: stats.totalDistance.toStringAsFixed(2), unit: 'km'),
            ],
          ),
          25.sBHh,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomePageStats(
                icon: Icons.timer,
                title: 'Total Time',
                value: '${stats.totalTime.inHours.toString().padLeft(2, '0')}:${stats.totalTime.inMinutes.remainder(60).toString().padLeft(2, '0')}',
                unit: 'm',
              ),
              HomePageStats(icon: Icons.bolt, title: 'Avg Pace', value: stats.avgPace.toString(), unit: 'm/km'),
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
                    child: Text('View all', style: STextTheme.text24.copyWith(color: AppColor.primary)),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: runs.length,
              itemBuilder: (context, index) {
                final run = runs[index];
                final date = run.completionDate;
                final monthName = DateFormat.MMMM().tryParse(date.toString());
                return RecentRunStats(
                  monthname: monthName?.toString() ?? '',
                  day: run.completionDate?.day ?? 0,
                  year: run.completionDate?.year ?? 0,
                  recentdistance: run.distance ?? 0,
                  recenttime:
                      '${run.duration?.inHours.toString().padLeft(2, '0') ?? '00'}:${run.duration?.inMinutes.remainder(60).toString().padLeft(2, '0') ?? '00'}',
                  recentpace: run.pace?.toString() ?? '0',
                  recentheartbeat: run.heartRate ?? 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
