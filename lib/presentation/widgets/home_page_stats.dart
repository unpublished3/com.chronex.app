import 'package:flutter/material.dart';
import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageStats extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final String? unit;
  const HomePageStats({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.unit,
  });

  @override
  State<HomePageStats> createState() => _HomePageStatsState();
}

class _HomePageStatsState extends State<HomePageStats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: 165.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 8.0),
            child: Row(
              children: [
                Icon(widget.icon, color: AppColor.primary, size: 25.0),
                Text(widget.title, style: STextTheme.text20),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 5.0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.value, style: STextTheme.text24),
                ),
              ),
              if (widget.unit != null)
                Text(widget.unit ?? '', style: STextTheme.text24),
            ],
          ),
        ],
      ),
    );
  }
}
