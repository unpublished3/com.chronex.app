import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:chronex/presentation/widgets/run_track_stats.dart';
import 'package:chronex/presentation/widgets/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveRunTrackPlay extends StatefulWidget {
  const ActiveRunTrackPlay({super.key});

  @override
  State<ActiveRunTrackPlay> createState() => _ActiveRunTrackPlayState();
}

class _ActiveRunTrackPlayState extends State<ActiveRunTrackPlay> {
  final Duration duration = const Duration(hours: 00, minutes: 00, seconds: 00);
  final double distance = 0.00;
  final Duration pace = const Duration(minutes: 00, seconds: 00);
  final int cadence = 0;
  final int calories = 0;
  final int heartbeat = 0;
  final int temp = 0;
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
                child: Text('Run in progress', style: STextTheme.whitetext26),
              ),
            ),
            30.sBHh,
            Text(
              '${duration.inHours.toString().padLeft(2, '0')}:${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}',
              style: STextTheme.whitetext60,
            ),
            Text('duration', style: STextTheme.greentextlight),
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
                  title: 'Temperature',
                  value: temp.toString(),
                  unit: '°C',
                ),
              ],
            ),
            50.sBHh,
            AppButton(
              onPressed: () {
                // routing
              },
              title: 'Pause Run',
              leadingIcon: const Icon(
                Icons.pause,
                color: AppColor.primary,
                size: 25.0,
              ),
              color: Colors.grey.shade100,
              titleColor: AppColor.primary,
              width: 360.w,
              height: 75.h,
              fontSize: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
