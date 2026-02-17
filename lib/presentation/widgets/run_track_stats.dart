import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chronex/base/theme/s_text_theme.dart';

class RunTrackStats extends StatefulWidget {
  const RunTrackStats({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.unit,
  });

  final IconData icon;
  final String title;
  final String value;
  final String unit;

  @override
  State<RunTrackStats> createState() => _RunTrackStatsState();
}

class _RunTrackStatsState extends State<RunTrackStats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152.w,
      height: 152.h,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100.withAlpha(42),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          5.sBHh,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, color: AppColor.white),
              6.sBWw,
              Text(widget.title, style: STextTheme.greenText),
            ],
          ),
          Text(widget.value, style: STextTheme.text36),
          Text(widget.unit, style: STextTheme.greenText),
        ],
      ),
    );
  }
}
