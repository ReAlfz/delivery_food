import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final ValueChanged<String>? onChanged;
  const SearchAppbarWidget({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
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
      child: TextField(
        onChanged: onChanged,
        style: AppStyle.f12TextW500Black,
        decoration: InputDecoration(
          hintText: 'Search Menu',
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(
              color: AppColor.primaryColor,
              width: 1.5,
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 26.r,
            color: Colors.grey,
          ),
          hintStyle: AppStyle.f12TextW500Black.copyWith(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
