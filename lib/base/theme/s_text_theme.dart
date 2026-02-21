import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter/material.dart';

class STextTheme {
  STextTheme._();

  static const TextStyle baseTextWhite = TextStyle(
    fontFamily: "Roboto",
    color: AppColor.white,
    fontWeight: FontWeight.w500,
  );
  static TextStyle whitetext60 = baseTextWhite.copyWith(fontSize: 60);
  static TextStyle whitetext36 = baseTextWhite.copyWith(fontSize: 36);
  static TextStyle whitetext26 = baseTextWhite.copyWith(fontSize: 26);
  static TextStyle whitetext24 = baseTextWhite.copyWith(fontSize: 24);
  static TextStyle whitetext20 = baseTextWhite.copyWith(fontSize: 20);
  static TextStyle whitetext18 = baseTextWhite.copyWith(fontSize: 18);
  static TextStyle twhitetext16 = baseTextWhite.copyWith(fontSize: 16);
  static TextStyle whitetext14 = baseTextWhite.copyWith(fontSize: 14);
  static TextStyle whitetext12 = baseTextWhite.copyWith(fontSize: 12);
  static TextStyle whitetext10 = baseTextWhite.copyWith(fontSize: 10);

  static const TextStyle baseTextBlack = TextStyle(
    fontFamily: "Roboto",
    color: AppColor.black,
    fontWeight: FontWeight.w500,
  );
  static TextStyle blacktext26 = baseTextBlack.copyWith(fontSize: 26);
  static TextStyle blacktext24 = baseTextBlack.copyWith(fontSize: 24);
  static TextStyle blacktext20 = baseTextBlack.copyWith(fontSize: 20);
  static TextStyle blacktext16 = baseTextBlack.copyWith(fontSize: 16);
  static TextStyle blacktext14 = baseTextBlack.copyWith(fontSize: 14);
  static TextStyle blacktext12 = baseTextBlack.copyWith(fontSize: 12);

  static TextStyle baseTextGreen = const TextStyle(
    color: AppColor.primary,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
  );
  static TextStyle greentextlight = baseTextGreen.copyWith(
    color: const Color.fromARGB(255, 205, 246, 157),
    fontSize: 23.0,
  );
  static TextStyle greentext24 = baseTextGreen.copyWith(fontSize: 24);
  static TextStyle greentext18 = baseTextGreen.copyWith(fontSize: 18);
}
