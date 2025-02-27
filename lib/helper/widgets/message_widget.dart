import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/helper/widgets/custom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageWidget extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const MessageWidget({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.warning_amber,
            color: AppColor.redColorE74C3C,
            size: 64.r,
          ),
          16.verticalSpace,
          Text(
            text,
            textAlign: TextAlign.center,
            style: AppStyle.f16TextW500Black,
          ),
          24.verticalSpace,
          if (onTap != null)
            CustomAppButton(
              text: 'Continue',
              color: AppColor.greenColor66CA98,
              onTap: onTap,
            ),
        ],
      ),
    );
  }
}
