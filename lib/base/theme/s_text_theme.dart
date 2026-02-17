import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter/material.dart';

class STextTheme {
  STextTheme._();

  static const TextStyle baseText = TextStyle(
    fontFamily: "Roboto",
    color: AppColor.black,
    fontWeight: FontWeight.w500,
  );
  static TextStyle text24 = baseText.copyWith(fontSize: 24);
  static TextStyle text20 = baseText.copyWith(fontSize: 20);
  static TextStyle text16 = baseText.copyWith(fontSize: 16);
  static TextStyle text14 = baseText.copyWith(fontSize: 14);
  static TextStyle text12 = baseText.copyWith(fontSize: 12);
  static TextStyle text10 = baseText.copyWith(fontSize: 10);

  static TextStyle whiteText = baseText.copyWith(
    color: AppColor.white,
    fontSize: 18.0,
  );
}
