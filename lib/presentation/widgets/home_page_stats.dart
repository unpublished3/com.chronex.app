import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageStats extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final String? unit;
  const HomePageStats({super.key, required this.icon, required this.title, required this.value, this.unit});

  @override
  State<HomePageStats> createState() => _HomePageStatsState();
}

class _HomePageStatsState extends State<HomePageStats> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 110.h,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.white,
          shape: BoxShape.rectangle,
          boxShadow: [BoxShadow(color: AppColor.black.withValues(alpha: 0.1), blurRadius: 8, offset: const Offset(0, 4))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(widget.icon, color: AppColor.primary, size: 24.sp),
                4.sBWh,
                Text(widget.title, style: STextTheme.text16),
              ],
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.value, style: STextTheme.text18),
                ),
                if (widget.unit != null) Text(" ${widget.unit!}", style: STextTheme.text18),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
