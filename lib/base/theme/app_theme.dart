import 'package:chronex/base/theme/app_color.dart';
import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.neutral50,
        titleTextStyle: STextTheme.blacktext16,
        centerTitle: false,
        actionsPadding: EdgeInsets.only(right: 24.w),
        titleSpacing: 0,
        surfaceTintColor: Colors.transparent,
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(4),
        ),
        side: const BorderSide(width: 1, color: AppColor.neutral100),
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColor.primary;
          return Colors.transparent;
        }),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.white,
        selectedLabelStyle: STextTheme.blacktext12,
        unselectedLabelStyle: STextTheme.blacktext12,
        selectedItemColor: AppColor.primary,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColor.white,
      ),
      bottomAppBarTheme: const BottomAppBarThemeData(
        color: AppColor.white,
        elevation: 0,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        insetPadding: EdgeInsets.all(20.sp),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColor.primary;
          return AppColor.neutral200;
        }),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColor.primary,
        selectionColor: AppColor.primary.withAlpha(40),
        selectionHandleColor: AppColor.primary,
      ),
      datePickerTheme: DatePickerThemeData(
        confirmButtonStyle: TextButton.styleFrom(
          foregroundColor: AppColor.primary,
          textStyle: STextTheme.blacktext14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        cancelButtonStyle: TextButton.styleFrom(
          foregroundColor: AppColor.neutral900,
          textStyle: STextTheme.blacktext14.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        // surfaceTintColor: AppColor.primary.withAlpha(10),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColor.neutral50,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 10.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: AppColor.neutral100, width: 1.sp),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: AppColor.neutral100, width: 1.sp),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: AppColor.primary, width: 1.sp),
          ),
          labelStyle: STextTheme.blacktext14.copyWith(color: AppColor.neutral),
        ),
        headerBackgroundColor: AppColor.primary,
        headerForegroundColor: AppColor.white,
        dayForegroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColor.white;
          if (states.contains(WidgetState.disabled)) return AppColor.neutral;
          return AppColor.neutral900;
        }),
        dayBackgroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColor.primary;
          return Colors.transparent;
        }),
      ),
    );
  }
}
