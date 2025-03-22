import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/helper/widgets/custom_appbar.dart';
import 'package:delivery_food/helper/widgets/tile_option_widget.dart';
import 'package:delivery_food/modules/menu/list_menu/view/components/menu_item.dart';
import 'package:delivery_food/modules/order/detail_order/controllers/detail_order_controller.dart';
import 'package:delivery_food/modules/order/detail_order/view/components/order_tracker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailOrderView extends StatelessWidget {
  const DetailOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    var detailController = DetailOrderController.to;
    return Scaffold(
      appBar: const CustomAppbar(text: 'Detail Order', enableBack: true),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () => detailController.fetchData(),
          child: Conditional.single(
            context: context,
            conditionBuilder: (context) => detailController.status.value,
            fallbackBuilder: (context) => const SizedBox(),
            widgetBuilder: (context) {
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                itemCount: detailController.orderData.value!.menu!.length,
                separatorBuilder: (context, index) => 8.verticalSpace,
                itemBuilder: (context, index) {
                  var menu = detailController.orderData.value!.menu![index];
                  return MenuItem(menu: menu);
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Conditional.single(
          context: context,
          conditionBuilder: (context) => detailController.status.value,
          fallbackBuilder: (context) => const SizedBox(),
          widgetBuilder: (context) => Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.h, horizontal: 22.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TileOptionWidget(
                        title: 'Total orders',
                        subtitle:
                            '(${detailController.orderData.value?.menu?.length} Menu):',
                        message:
                            'Rp ${detailController.orderData.value?.totalPrice}',
                        titleStyle: AppStyle.f14TextW500Black,
                        messageStyle: AppStyle.f14TextW500Black.copyWith(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(color: Colors.black45, height: 2.h),
                      TileOptionWidget(
                        icon: Icons.payment_outlined,
                        iconSize: 24.r,
                        title: 'Payment'.tr,
                        message: 'Pay Later',
                        titleStyle: AppStyle.f14TextW500Black,
                        messageStyle: AppStyle.f14TextW500Black,
                      ),
                      Divider(color: Colors.black54, height: 2.h),
                      18.verticalSpace,
                      const OrderTracker(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
