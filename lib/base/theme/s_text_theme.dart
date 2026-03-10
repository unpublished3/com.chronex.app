import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class STextTheme {
  STextTheme._();

  static const TextStyle baseText = TextStyle(
    fontFamily: "Roboto",
    color: AppColor.black,
    fontWeight: FontWeight.w500,
  );
  static TextStyle text60 = baseText.copyWith(fontSize: 60.sp);
  static TextStyle text45 = baseText.copyWith(fontSize: 45.sp);
  static TextStyle text30 = baseText.copyWith(fontSize: 30.sp);
  static TextStyle text36 = baseText.copyWith(fontSize: 36.sp);
  static TextStyle text26 = baseText.copyWith(fontSize: 26.sp);
  static TextStyle text24 = baseText.copyWith(fontSize: 24.sp);
  static TextStyle text22 = baseText.copyWith(fontSize: 22.sp);
  static TextStyle text20 = baseText.copyWith(fontSize: 20.sp);
  static TextStyle text18 = baseText.copyWith(fontSize: 18.sp);
  static TextStyle text16 = baseText.copyWith(fontSize: 16.sp);
  static TextStyle text14 = baseText.copyWith(fontSize: 14.sp);
  static TextStyle text12 = baseText.copyWith(fontSize: 12.sp);
  static TextStyle text10 = baseText.copyWith(fontSize: 10.sp);
}
