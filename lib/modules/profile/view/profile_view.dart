import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/helper/widgets/custom_app_button.dart';
import 'package:delivery_food/helper/widgets/custom_appbar.dart';
import 'package:delivery_food/helper/widgets/tile_option_widget.dart';
import 'package:delivery_food/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional/flutter_conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var profileController = ProfileController.to;
    return Scaffold(
      appBar: const CustomAppbar(text: 'Profile'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
        children: [
          16.verticalSpace,
          Center(
            child: Container(
              width: 170.r,
              height: 170.r,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.mintColor,
              ),
            ),
          ),
          32.verticalSpace,
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              'Account info'.tr,
              style: AppStyle.f18TextW600Black.copyWith(
                color: AppColor.greenColor66CA98,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          16.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColor.whiteLightColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                TileOptionWidget(
                  title: 'Name',
                  message: profileController.auth.value?.username ?? '',
                ),
                TileOptionWidget(
                  title: 'Phone Number',
                  message: profileController.auth.value?.phone ?? '',
                ),
                TileOptionWidget(
                  title: 'Pin',
                  message: profileController.auth.value?.pin ?? '',
                ),
                Conditional.single(
                  condition: profileController.savingStatus.value == true,
                  fallback: const SizedBox(),
                  widget: CustomAppButton(
                    text: 'Save',
                    color: AppColor.primaryColor,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          16.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.2.sw),
            child: CustomAppButton(
              text: 'Logout',
              color: AppColor.redColorE74C3C,
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
