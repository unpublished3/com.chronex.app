import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class STextTheme {
  STextTheme._();

  static const TextStyle baseText = TextStyle(fontFamily: "Roboto", color: AppColor.black, fontWeight: FontWeight.w500);
  static TextStyle text24 = baseText.copyWith(fontSize: 24.sp);
  static TextStyle text20 = baseText.copyWith(fontSize: 20.sp);
  static TextStyle text16 = baseText.copyWith(fontSize: 16.sp);
  static TextStyle text14 = baseText.copyWith(fontSize: 14.sp);
  static TextStyle text12 = baseText.copyWith(fontSize: 12.sp);
  static TextStyle text10 = baseText.copyWith(fontSize: 10.sp);
}
