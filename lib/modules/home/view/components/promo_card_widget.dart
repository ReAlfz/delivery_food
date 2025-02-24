import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/modules/home/models/voucher_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoCardWidget extends StatelessWidget {
  final bool? enableShadow;
  final VoidCallback? onTap;
  final VoucherModel voucher;
  final double? witdh;
  const PromoCardWidget({
    super.key,
    required this.voucher,
    this.enableShadow,
    this.onTap,
    this.witdh,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: witdh ?? 240.w,
        height: 180.h,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
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
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              Text(
                voucher.name ?? '',
                style: AppStyle.f14TextW500White,
              )
            ],
          ),
        ),
      ),
    );
  }
}
