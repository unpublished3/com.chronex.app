import 'package:chronex/presentation/provider/home_stats_provider.dart';
import 'package:chronex/presentation/provider/recent_runs_provider.dart';
import 'package:flutter/material.dart';
import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:chronex/presentation/widgets/recent_run_stats.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HistroryPage extends ConsumerStatefulWidget {
  const HistroryPage({super.key});

  @override
  ConsumerState<HistroryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistroryPage> {
  @override
  void initState() {
    super.initState();
    ref.read(recentRunsProvider.notifier).getAllRuns();
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(25.0),
              height: 120.h,
              width: 370.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: const Color.fromARGB(255, 197, 254, 198)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.h),
                    child: Row(
                      children: [
                        const Icon(Icons.directions_run, color: AppColor.primary, size: 25.0),
                        5.sBHw,
                        Text('Total Runs: ${stats.totalRuns.toString()}', style: STextTheme.text24.copyWith(color: AppColor.primary)),
                      ],
                    ),
                  ),
                  Center(
                    child: Text('Keep up the great work! Every run counts.', style: STextTheme.text18.copyWith(color: AppColor.primary)),
                  ),
                ],
              ),
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
      ),
    );
  }
}
