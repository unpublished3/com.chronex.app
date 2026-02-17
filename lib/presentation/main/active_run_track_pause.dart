import 'package:flutter/material.dart';
import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:chronex/presentation/widgets/run_track_stats.dart';
import 'package:chronex/presentation/widgets/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveRunTrackPause extends StatefulWidget {
  const ActiveRunTrackPause({super.key});

  @override
  State<ActiveRunTrackPause> createState() => _ActiveRunTrackPauseState();
}

class _ActiveRunTrackPauseState extends State<ActiveRunTrackPause> {
  final Duration duration = const Duration(hours: 01, minutes: 23, seconds: 44);
  final double distance = 15.7;
  final Duration pace = const Duration(minutes: 5, seconds: 25);
  final int cadence = 135;
  final int calories = 1500;
  final int heartbeat = 122;
  final int temp = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColor.primary),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 30.0, 0.0, 0.0),
                child: Text('Run paused', style: STextTheme.text26),
              ),
            ),
            30.sBHh,
            Text(
              '${duration.inHours.toString().padLeft(2, '0')}:${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}',
              style: STextTheme.text60,
            ),
            Text('duration', style: STextTheme.greenText),
            40.sBHh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RunTrackStats(
                  icon: Icons.location_on,
                  title: 'Distance',
                  value: distance.toStringAsFixed(2),
                  unit: 'km',
                ),
                RunTrackStats(
                  icon: Icons.flash_on,
                  title: 'Pace',
                  value:
                      '${pace.inMinutes.remainder(60).toString()}:${pace.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                  unit: 'min/km',
                ),
              ],
            ),
            20.sBHh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RunTrackStats(
                  icon: Icons.directions_run,
                  title: 'Cadence',
                  value: cadence.toString(),
                  unit: 'spm',
                ),
                RunTrackStats(
                  icon: Icons.local_fire_department,
                  title: 'Calories',
                  value: calories.toString(),
                  unit: 'kcal',
                ),
              ],
            ),
            20.sBHh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RunTrackStats(
                  icon: Icons.favorite,
                  title: 'Heart rate',
                  value: heartbeat.toString(),
                  unit: 'bpm',
                ),
                RunTrackStats(
                  icon: Icons.thermostat,
                  title: 'Temp',
                  value: temp.toString(),
                  unit: '°C',
                ),
              ],
            ),
            50.sBHh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(
                  onPressed: () {
                    // routing
                  },
                  title: 'Resume Run',
                  leadingIcon: const Icon(
                    Icons.play_arrow,
                    color: AppColor.primary,
                    size: 25.0,
                  ),
                  color: Colors.grey.shade100,
                  titleColor: AppColor.primary,
                  width: 175.w,
                  height: 75.h,
                  fontSize: 20.0,
                ),
                AppButton(
                  onPressed: () {
                    // routing
                  },
                  title: 'Finish Run',
                  leadingIcon: const Icon(
                    Icons.stop,
                    color: AppColor.primary,
                    size: 25.0,
                  ),
                  color: Colors.grey.shade100,
                  titleColor: AppColor.primary,
                  width: 175.w,
                  height: 75.h,
                  fontSize: 20.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
