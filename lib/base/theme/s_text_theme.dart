import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter/material.dart';

class STextTheme {
  STextTheme._();

  static const TextStyle baseText = TextStyle(
    fontFamily: "Roboto",
    color: AppColor.black,
    fontWeight: FontWeight.w500,
  );
  static TextStyle text60 = baseText.copyWith(fontSize: 60);
  static TextStyle text45 = baseText.copyWith(fontSize: 45);
  static TextStyle text30 = baseText.copyWith(fontSize: 30);
  static TextStyle text36 = baseText.copyWith(fontSize: 36);
  static TextStyle text26 = baseText.copyWith(fontSize: 26);
  static TextStyle text24 = baseText.copyWith(fontSize: 24);
  static TextStyle text22 = baseText.copyWith(fontSize: 22);
  static TextStyle text20 = baseText.copyWith(fontSize: 20);
  static TextStyle text18 = baseText.copyWith(fontSize: 18);
  static TextStyle text16 = baseText.copyWith(fontSize: 16);
  static TextStyle text14 = baseText.copyWith(fontSize: 14);
  static TextStyle text12 = baseText.copyWith(fontSize: 12);
  static TextStyle text10 = baseText.copyWith(fontSize: 10);
}
