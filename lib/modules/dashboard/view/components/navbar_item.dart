import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NavbarItem extends StatelessWidget {
  final String svgPicture;
  final Size svgSize;
  final String textPicture;
  final bool condition;
  final Function() onTap;
  const NavbarItem({
    super.key,
    required this.svgPicture,
    required this.condition,
    required this.textPicture,
    required this.onTap,
    required this.svgSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgPicture,
            height: svgSize.height,
            width: svgSize.width,
            colorFilter: ColorFilter.mode(
              condition ? AppColor.primaryColor : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          5.verticalSpace,
          Text(
            textPicture,
            style: AppStyle.f12TextW500Black.copyWith(
              color: condition ? AppColor.blackColor1F1F1F : Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
