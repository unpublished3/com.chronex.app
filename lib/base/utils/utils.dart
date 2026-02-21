import 'package:chronex/base/theme/app_color.dart';
import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:chronex/main.dart';
import 'package:flutter/material.dart';

void showSnackBar(String message) {
  rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  rootScaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),
      dismissDirection: DismissDirection.down,
      content: Align(
        alignment: Alignment.center,
        child: IntrinsicWidth(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: AppColor.black.withAlpha(90),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              message,
              style: STextTheme.blacktext14.copyWith(color: AppColor.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ),
  );
}
