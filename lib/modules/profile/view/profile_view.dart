import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/helper/widgets/custom_app_button.dart';
import 'package:delivery_food/helper/widgets/custom_appbar.dart';
import 'package:delivery_food/helper/widgets/tile_option_widget.dart';
import 'package:delivery_food/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var profileController = ProfileController.to;
    return Scaffold(
      appBar: const CustomAppbar(text: 'Profile'),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
              child: Obx(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TileOptionWidget(
                      title: 'Name',
                      message: profileController.auth.value?.username ?? '',
                      onTap: () {},
                    ),
                    const Divider(),
                    TileOptionWidget(
                      title: 'Phone Number',
                      message: profileController.auth.value?.phone ?? '',
                      onTap: () {},
                    ),
                    const Divider(),
                    TileOptionWidget(
                      title: 'Address',
                      message: profileController.auth.value?.address ?? '..',
                      onTap: () {},
                    ),
                    const Divider(),
                    TileOptionWidget(
                      title: 'Pin',
                      message: profileController.auth.value?.pin ?? '..',
                      onTap: profileController.change,
                    ),
                  ],
                ),
              ),
            ),
            8.verticalSpace,
            Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: Conditional.single(
                  context: context,
                  conditionBuilder: (context) =>
                      profileController.savingStatus.value == true,
                  fallbackBuilder: (context) => SizedBox(height: 45.h),
                  widgetBuilder: (context) => CustomAppButton(
                    key: ValueKey<bool>(profileController.savingStatus.value),
                    text: 'Save',
                    color: AppColor.primaryColor,
                    width: 0.4.sw,
                    onTap: () {},
                  ),
                ),
              ),
            ),
            48.verticalSpace,
            CustomAppButton(
              text: 'Logout',
              color: AppColor.redColorE74C3C,
              width: 0.4.sw,
              onTap: () {},
            ),
            32.verticalSpace,
          ],
        ),
      ),
    );
  }
}
