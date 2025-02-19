import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/helper/widgets/custom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterDialog extends StatelessWidget {
  const RegisterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 24.h,
      ),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle_outline_rounded,
            color: AppColor.primaryColor,
            size: 85.r,
          ),
          15.verticalSpace,
          Text(
            'account is successfully registered, please login to continue',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: AppStyle.f16TextW600Black,
          ),
          24.verticalSpace,
          CustomAppButton(
            color: AppColor.primaryColor,
            text: 'Continue',
            onTap: () => Get.close(2),
          ),
        ],
      ),
    );
  }
}
