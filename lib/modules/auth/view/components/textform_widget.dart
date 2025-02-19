import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextformWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;
  final String hint;
  final bool isObscure;
  final String? Function(String?)? validate;
  final int? minLength;
  final String? errorText;
  final Widget? suffixIcon;

  const TextformWidget({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.label,
    required this.hint,
    required this.isObscure,
    this.minLength,
    this.suffixIcon,
    this.errorText,
    this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: AppStyle.f14TextW500Black,
        ),
        10.verticalSpace,
        TextFormField(
          keyboardType: keyboardType,
          obscureText: isObscure,
          onChanged: (text) => controller.text = text,
          autocorrect: false,
          style: AppStyle.f14TextW500Black,
          validator: validate,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: suffixIcon,
            errorText: errorText,
            isDense: true,
            hintStyle: AppStyle.f14TextW500Black.copyWith(color: Colors.grey),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(
                color: AppColor.redColorE74C3C,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(
                color: AppColor.greenColor66CA98,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(
                color: AppColor.primaryColor,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(
                color: AppColor.redColorE74C3C,
                width: 1,
              ),
            ),
            contentPadding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 16.h,
              bottom: 16.h,
            ),
          ),
        ),
      ],
    );
  }
}
