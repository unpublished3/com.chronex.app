import 'package:flutter/material.dart';
import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:chronex/presentation/widgets/recent_run_stats.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HistroryPage extends StatefulWidget {
  const HistroryPage({super.key});

  @override
  State<HistroryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistroryPage> {
  int totalruns = 1;
  DateTime now = DateTime.now();
  String monthname = DateFormat('MMM').format(DateTime.now());
  double recentdistance = 14.5;
  Duration recenttime = const Duration(hours: 1, minutes: 30);
  Duration recentpace = const Duration(minutes: 5, seconds: 25);
  int recentheartbeat = 144;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
          child: Text(
            'Chronex',
            style: STextTheme.text26.copyWith(color: AppColor.white),
          ),
        ),
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color.fromARGB(255, 197, 254, 198),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.h),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.directions_run,
                          color: AppColor.primary,
                          size: 25.0,
                        ),
                        5.sBHw,
                        Text(
                          'Total Runs: $totalruns',
                          style: STextTheme.text24.copyWith(
                            color: AppColor.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      'Keep up the great work! Every run counts.',
                      style: STextTheme.text18.copyWith(
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                ],
              ),
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
      ),
    );
  }
}
