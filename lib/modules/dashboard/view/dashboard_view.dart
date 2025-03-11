import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/assets_const.dart';
import 'package:delivery_food/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:delivery_food/modules/dashboard/view/components/navbar_item.dart';
import 'package:delivery_food/modules/menu/list_menu/view/home_view.dart';
import 'package:delivery_food/modules/order/list_order/view/order_view.dart';
import 'package:delivery_food/modules/profile/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          sizing: StackFit.expand,
          index: DashboardController.to.index.value,
          children: const [
            HomeView(),
            OrderView(),
            ProfileView(),
          ],
        );
      }),
      bottomNavigationBar: BottomAppBar(
        color: AppColor.whiteColor,
        child: Container(
          height: 0.08.sh,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(111, 24, 24, 24),
                blurRadius: 15,
                spreadRadius: -1,
                offset: Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.r),
            ),
          ),
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NavbarItem(
                  svgPicture: AssetsConst.homeIcon,
                  condition: DashboardController.to.index.value == 0,
                  textPicture: 'Home',
                  svgSize: const Size(24, 24),
                  onTap: () => DashboardController.to.changeIndex(0),
                ),
                NavbarItem(
                  svgPicture: AssetsConst.orderIcon,
                  condition: DashboardController.to.index.value == 1,
                  textPicture: 'Order',
                  svgSize: const Size(24, 25),
                  onTap: () => DashboardController.to.changeIndex(1),
                ),
                NavbarItem(
                  svgPicture: AssetsConst.profileIcon,
                  condition: DashboardController.to.index.value == 2,
                  textPicture: 'Profile',
                  svgSize: const Size(26, 26),
                  onTap: () => DashboardController.to.changeIndex(2),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
