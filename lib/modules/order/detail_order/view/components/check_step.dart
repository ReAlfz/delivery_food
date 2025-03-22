import 'package:delivery_food/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckStep extends StatelessWidget {
  const CheckStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.r,
      width: 30.r,
      decoration: const BoxDecoration(
        color: AppColor.primaryColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 8,
            spreadRadius: -1,
            color: Colors.black54,
          ),
        ],
      ),
      child: Icon(
        Icons.check,
        color: AppColor.whiteColor,
        size: 22.r,
      ),
    );
  }
}
