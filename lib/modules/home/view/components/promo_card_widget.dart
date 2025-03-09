import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/constants/assets_const.dart';
import 'package:delivery_food/modules/home/models/voucher_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PromoCardWidget extends StatelessWidget {
  final bool? enableShadow;
  final VoidCallback? onTap;
  final VoucherModel voucher;
  final double? witdh;
  final double? height;
  const PromoCardWidget({
    super.key,
    required this.voucher,
    this.enableShadow,
    this.onTap,
    this.witdh,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        width: witdh ?? 300.w,
        height: height ?? 180.h,
        decoration: BoxDecoration(
          color: AppColor.mintColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            if (enableShadow == true)
              const BoxShadow(
                color: Color.fromARGB(115, 71, 70, 70),
                offset: Offset(0, 2),
                blurRadius: 8,
              ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: SvgPicture.asset(
                voucher.isDiscount == true
                    ? AssetsConst.discountBg
                    : AssetsConst.nominalBg,
                colorFilter: const ColorFilter.mode(
                  AppColor.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: SvgPicture.asset(
                AssetsConst.lineBg,
                colorFilter: const ColorFilter.mode(
                  AppColor.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.all(8.r),
                constraints: BoxConstraints(maxWidth: 160.w),
                child: Text(
                  voucher.name ?? '',
                  style: AppStyle.f24PrimaryW600,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(bottom: 30.h),
                child: Text(
                  voucher.isDiscount == true
                      ? '${voucher.price} %'
                      : 'Rp. ${voucher.price}',
                  style: AppStyle.f24PrimaryW600.copyWith(
                    fontSize: 32.sp,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
