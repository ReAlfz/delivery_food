import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuOptionsWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  const MenuOptionsWidget({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 4.h,
        ),
        decoration: BoxDecoration(
          color: (isSelected) ? AppColor.primaryColor : null,
          borderRadius: BorderRadius.circular(30.r),
          border: (!isSelected)
              ? Border.all(
                  color: AppColor.primaryColor,
                  width: 1.5.r,
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppStyle.f16TextW500Black.copyWith(
                color: (isSelected)
                    ? AppColor.whiteColor
                    : AppColor.blackColor1F1F1F,
              ),
            ),
            if (isSelected) ...[
              2.5.horizontalSpace,
              const Icon(
                Icons.check,
                color: AppColor.whiteColor,
                size: 15,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
