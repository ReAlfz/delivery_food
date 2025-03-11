import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListOrderAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ListOrderAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16.r),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(111, 24, 24, 24),
            blurRadius: 15,
            spreadRadius: -1,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: TabBar(
        indicatorWeight: 3.h,
        labelColor: AppColor.primaryColor,
        unselectedLabelColor: Colors.grey[400],
        indicatorColor: AppColor.primaryColor,
        labelStyle: AppStyle.f18TextW600Black,
        tabs: const [
          Tab(
            text: 'On Going',
          ),
          Tab(
            text: 'History',
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
