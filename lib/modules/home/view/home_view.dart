import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/modules/home/controllers/home_controller.dart';
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: SearchAppbarWidget(
          onChanged: (value) => HomeController.to.keyword(value),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
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
                      separatorBuilder: (context, index) => 24.horizontalSpace,
                      itemCount: homeController.listVoucher.length,
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
              )
            ];
          },
          body: Obx(() {
            return SmartRefresher(
              controller: homeController.refreshController,
              onRefresh: homeController.refreshHome,
              enablePullUp: homeController.canLoadMore.value,
              enablePullDown: true,
              child: ListView.builder(
                itemCount: homeController.listMenu.length,
                itemBuilder: (context, index) {},
              ),
            );
          }),
        ),
      ),
    );
  }
}
