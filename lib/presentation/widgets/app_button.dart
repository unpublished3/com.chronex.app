import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.color,
    this.leadingIcon,
    this.borderRadius,
    this.height,
    this.width,
    this.titleColor,
    this.elevation,
    this.isOutlinedButton = false,
    this.isDisabled = false,
    this.isLoading = false,
    this.padding,
    this.fontSize,
    this.borderSideColor,
    this.isAlt = false,
  });

  final VoidCallback onPressed;
  final String title;
  final Color? color;
  final Widget? leadingIcon;
  final double? borderRadius;
  final double? height;
  final double? width;
  final Color? titleColor;
  final bool? isOutlinedButton;
  final double? elevation;
  final bool? isDisabled;
  final bool isLoading;
  final EdgeInsets? padding;
  final double? fontSize;
  final Color? borderSideColor;
  final bool isAlt;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = isAlt ? AppColor.white : color ?? AppColor.primary;
    final effectiveBorderSide = isAlt
        ? const BorderSide(color: AppColor.neutral100, width: 1)
        : (isOutlinedButton == true ? BorderSide(color: borderSideColor ?? AppColor.neutral, width: 1) : BorderSide.none);
    final effectiveTitleColor = isAlt ? AppColor.black : titleColor ?? AppColor.white;

    return SizedBox(
      height: height ?? 40.h,
      width: width,
      child: ElevatedButton(
        onPressed: isDisabled == true || isLoading == true ? null : onPressed,
        style: ElevatedButton.styleFrom(
          overlayColor: effectiveColor == AppColor.white ? AppColor.primary : Colors.transparent,
          splashFactory: InkRipple.splashFactory,
          elevation: elevation,
          padding: padding ?? EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            side: effectiveBorderSide,
            borderRadius: borderRadius != null ? BorderRadius.circular(borderRadius!) : BorderRadius.circular(8),
          ),
          disabledBackgroundColor: AppColor.neutral,
          backgroundColor: effectiveColor,
        ),
        child: isLoading
            ? const CupertinoActivityIndicator()
            : leadingIcon == null
            ? Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600, color: effectiveTitleColor, fontSize: fontSize ?? 14.sp),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  leadingIcon!,
                  8.sBWw,
                  Text(
                    title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600, color: effectiveTitleColor, fontSize: fontSize ?? 14.sp),
                  ),
                ],
              ),
      ),
    );
  }
}
