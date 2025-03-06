import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/modules/home/controllers/home_controller.dart';
import 'package:delivery_food/modules/home/view/components/chip_widget.dart';
import 'package:delivery_food/modules/home/view/components/menu_card_widget.dart';
import 'package:delivery_food/modules/home/view/components/promo_card_widget.dart';
import 'package:delivery_food/modules/home/view/components/search_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var homeController = HomeController.to;
    var globalController = GlobalController.to;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: const SearchAppbarWidget(enable: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SmartRefresher(
            controller: homeController.refreshController,
            onRefresh: homeController.refreshHome,
            onLoading: homeController.onLoadingHome,
            enablePullUp: homeController.loadMoreStatus(),
            enablePullDown: true,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: 32.verticalSpace),
                SliverToBoxAdapter(
                  child: Text(
                    'Promo Available',
                    style: AppStyle.f24PrimaryW600,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Obx(() {
                    return SizedBox(
                      width: 1.sw,
                      height: 180.h,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            24.horizontalSpace,
                        itemCount: homeController.listVoucher.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final voucher = homeController.listVoucher[index];
                          return PromoCardWidget(
                            enableShadow: true,
                            voucher: voucher,
                          );
                        },
                      ),
                    );
                  }),
                ),
                SliverToBoxAdapter(child: 32.verticalSpace),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 48.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeController.categoryMapping.length,
                      separatorBuilder: (context, index) => 16.horizontalSpace,
                      itemBuilder: (context, index) {
                        String category = homeController.categoryMapping.keys
                            .elementAt(index);
                        return Obx(() {
                          return ChipWidget(
                            onTap: () =>
                                homeController.changeCurrentCategory(category),
                            isSelected: homeController.currentCategory.value ==
                                category,
                            text: category,
                            frontIcon: homeController.iconCategory[category],
                          );
                        });
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: 32.verticalSpace),
                Obx(() {
                  return SliverList.separated(
                    itemCount: homeController.currentList.length,
                    separatorBuilder: (context, index) => 8.verticalSpace,
                    itemBuilder: (context, index) {
                      var menu = homeController.currentList[index];
                      return MenuCardWidget(
                        menu: menu,
                        onTap: () => homeController.goToDetail(menu.id!),
                        onDecrement: () => globalController.decrementQuantity(
                          menu: menu,
                          currentList: homeController.currentList,
                        ),
                        onIncrement: () => globalController.incrementQuantity(
                          menu: menu,
                          currentList: homeController.currentList,
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
        floatingActionButton: Obx(() {
          if (globalController.selectedMenuList.isNotEmpty) {
            return FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              onPressed: homeController.goToCheckout,
              child: const Icon(
                Icons.shopping_cart_outlined,
              ),
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
