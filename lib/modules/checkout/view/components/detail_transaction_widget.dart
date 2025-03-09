import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/constants/assets_const.dart';
import 'package:delivery_food/helper/widgets/tile_option_widget.dart';
import 'package:delivery_food/modules/checkout/controllers/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DetailTransactionWidget extends StatelessWidget {
  const DetailTransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var checkoutController = CheckoutController.to;
    return Obx(() {
      return Container(
        height: 0.28.sh,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 8.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TileOptionWidget(
                    title: 'Total Orders',
                    message: checkoutController.intlConvert(
                      checkoutController.getPrice(),
                    ),
                  ),
                  Divider(height: 8.h, color: AppColor.blackColor1F1F1F),
                  TileOptionWidget(
                    title: 'Discount',
                    message: checkoutController.intlConvert(
                      checkoutController.getDiscount(),
                    ),
                    onTap: checkoutController.selectDiscount,
                  ),
                  Divider(height: 8.h, color: AppColor.blackColor1F1F1F),
                  const TileOptionWidget(
                    title: 'Payment Method',
                    message: 'Pay Later',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                color: AppColor.whiteColor,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetsConst.totalPaymentIcon,
                    ),
                    9.horizontalSpace,
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total payment',
                            style: AppStyle.f16TextW600Black,
                          ),
                          Text(
                            checkoutController.intlConvert(
                              checkoutController.getGrandTotalPrice(),
                            ),
                            style: AppStyle.f16TextW500Black.copyWith(
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: ElevatedButton(
                        onPressed: checkoutController.createOrder,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                          maximumSize: Size(1.sw, 48.h),
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          elevation: 2,
                          minimumSize: Size(1.sw, 48.h),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Order Now',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center,
                                style: AppStyle.f16TextW600White,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
