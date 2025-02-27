import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipWidget extends StatelessWidget {
  final bool isSelected;
  final String text;
  final IconData? frontIcon;
  final IconData? backIcon;
  final Function()? onTap;
  const ChipWidget({
    super.key,
    required this.isSelected,
    required this.text,
    this.frontIcon,
    this.backIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Ink(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: isSelected ? AppColor.blackColor1F1F1F : AppColor.primaryColor,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 8,
              spreadRadius: -1,
              color: Colors.black54,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (frontIcon != null) ...[
              Icon(
                frontIcon,
                size: 20,
                color: AppColor.whiteColor,
              ),
              SizedBox(width: 5.w),
            ],
            Text(
              text,
              style: AppStyle.f12TextW500White,
            ),
            if (backIcon != null && isSelected)
              Icon(
                backIcon,
                size: 20,
                color: AppColor.whiteColor,
              ),
          ],
        ),
      ),
    );
  }
}
