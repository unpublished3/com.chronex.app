import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.validator,
    this.focusNode,
    this.enabled = true,
    this.fillColor = AppColor.white,
    this.borderRadius,
    this.contentPadding,
    this.errorText,
    this.onSubmitted,
    this.textInputAction,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.counterText,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.obscuringCharacter = '•',
    this.showObscureTextToggle = false,
    this.readOnly = false,
    this.height,
    this.onTap,
  });

  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final bool enabled;
  final Color fillColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final String? errorText;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final String? counterText;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final String obscuringCharacter;
  final bool showObscureTextToggle;
  final bool readOnly;
  final VoidCallback? onTap;
  final double? height;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.showObscureTextToggle;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.height != null) {
      return Container(
        height: widget.height ?? 44.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
          // boxShadow: [BoxShadow(color: const Color(0xffe4e5e7).withOpacity(0.24), offset: const Offset(0, 1), blurRadius: 2, spreadRadius: 0)],
        ),
        child: TextFormField(
          onTap: widget.onTap,
          readOnly: widget.readOnly,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          onChanged: widget.onChanged,
          focusNode: widget.focusNode,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          validator: widget.validator,
          enabled: widget.enabled,
          onFieldSubmitted: widget.onSubmitted,
          textInputAction: widget.textInputAction,
          autofocus: widget.autofocus,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          textCapitalization: widget.textCapitalization,
          style:
              widget.style ??
              STextTheme.text14.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColor.black,
              ),
          obscuringCharacter: widget.obscuringCharacter,
          decoration: InputDecoration(
            filled: true,
            counterText: widget.counterText,
            hintText: widget.hintText,
            labelText: widget.labelText,
            prefix: widget.prefix,
            prefixIcon: widget.prefixIcon,
            suffixIcon:
                widget.suffixIcon ??
                (widget.showObscureTextToggle
                    ? _buildObscureTextToggle()
                    : null),
            suffix: widget.suffix,
            fillColor: widget.fillColor,
            contentPadding:
                widget.contentPadding ??
                EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
            errorText: widget.errorText,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.neutral100.withValues(alpha: 0.8),
                width: 1.r,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.neutral100, width: 1.r),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.neutral100, width: 1.r),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.neutral100, width: 1.r),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
            ),
          ),
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
        // boxShadow: [BoxShadow(color: const Color(0xffe4e5e7).withOpacity(0.24), offset: const Offset(0, 1), blurRadius: 2, spreadRadius: 0)],
      ),
      child: TextFormField(
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        focusNode: widget.focusNode,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: widget.validator,
        enabled: widget.enabled,
        onFieldSubmitted: widget.onSubmitted,
        textInputAction: widget.textInputAction,
        autofocus: widget.autofocus,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        maxLength: widget.maxLength,
        textCapitalization: widget.textCapitalization,
        style:
            widget.style ??
            STextTheme.text14.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColor.black,
            ),
        obscuringCharacter: widget.obscuringCharacter,
        decoration: InputDecoration(
          filled: true,
          counterText: widget.counterText,
          hintText: widget.hintText,
          labelText: widget.labelText,
          prefix: widget.prefix,
          prefixIcon: widget.prefixIcon,
          suffixIcon:
              widget.suffixIcon ??
              (widget.showObscureTextToggle ? _buildObscureTextToggle() : null),
          suffix: widget.suffix,
          fillColor: widget.fillColor,
          contentPadding:
              widget.contentPadding ??
              EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
          errorText: widget.errorText,
          // errorStyle: errorStyle ?? STextTheme.caption1.copyWith(fontWeight: FontWeight.w400, color: AppColor.red500),
          hintStyle: STextTheme.text14.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColor.neutral,
          ),
          // labelStyle: labelStyle ?? STextTheme.caption1.copyWith(fontWeight: FontWeight.w400, color: AppColor.gray400),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.neutral100, width: 1.r),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.neutral100, width: 1.r),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.neutral100, width: 1.r),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.neutral100, width: 1.r),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
          ),
        ),
      ),
    );
  }

  Widget? _buildObscureTextToggle() {
    return IconButton(
      icon: Icon(
        _obscureText
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        color: AppColor.neutral200,
        size: 20.w,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}

class LabelInputGroupWidget extends StatelessWidget {
  const LabelInputGroupWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.showObscureTextToggle = false,
    this.validator,
    this.maxLines = 1,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String label;
  final String? hintText;
  final bool showObscureTextToggle;
  final String? Function(String?)? validator;
  final int maxLines;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: STextTheme.text14),
        8.sBHh,
        AppTextField(
          hintText: hintText,
          controller: controller,
          showObscureTextToggle: showObscureTextToggle,
          validator: validator,
          maxLines: maxLines,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
