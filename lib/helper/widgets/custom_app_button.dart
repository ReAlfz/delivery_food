import 'package:delivery_food/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppButton extends StatelessWidget {
  final Function()? onTap;
  final double? width, height;
  final String? text;
  final Color color;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Widget? widget;
  const CustomAppButton({
    super.key,
    this.onTap,
    this.width,
    this.height,
    this.text,
    required this.color,
    this.borderRadius,
    this.textStyle,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: color,
        disabledForegroundColor: color,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 6.h),
        minimumSize: Size(
          width ?? double.infinity,
          height ?? 45.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          side: BorderSide(color: onTap != null ? color : Colors.transparent),
        ),
      ),
      child: widget ??
          Text(
            text ?? '',
            style: textStyle ?? AppStyle.f14TextW500White,
          ),
    );
  }
}
