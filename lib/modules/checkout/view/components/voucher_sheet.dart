import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/modules/menu/list_menu/controllers/menu_controller.dart';
import 'package:delivery_food/modules/menu/list_menu/view/components/promo_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VoucherSheet extends StatelessWidget {
  const VoucherSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            child: Text(
              'Select a voucher',
              style: AppStyle.f18TextW600Black,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 8.h,
              ),
              itemCount: HomeController.to.listVoucher.length,
              separatorBuilder: (context, index) => 8.verticalSpace,
              itemBuilder: (context, index) {
                final voucher = HomeController.to.listVoucher[index];
                return PromoCardWidget(
                  onTap: () => Get.back(result: voucher),
                  voucher: voucher,
                  height: 150.h,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
