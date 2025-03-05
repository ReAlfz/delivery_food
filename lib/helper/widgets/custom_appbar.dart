import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool? enableBack;
  const CustomAppbar({super.key, required this.text, this.enableBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
        style: AppStyle.f18TextW600Black,
      ),
      backgroundColor: AppColor.whiteColor,
      elevation: 4,
      shadowColor: const Color.fromARGB(111, 24, 24, 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16.r),
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: enableBack == true
          ? InkWell(
              onTap: Get.back,
              child: Icon(
                Icons.chevron_left_rounded,
                color: AppColor.blackColor1F1F1F,
                size: 28.r,
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
