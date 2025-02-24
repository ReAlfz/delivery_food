import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/constants/data_const.dart';
import 'package:delivery_food/modules/home/models/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuCardWidget extends StatelessWidget {
  final MenuModel menu;
  final VoidCallback? onTap;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  const MenuCardWidget({
    super.key,
    required this.menu,
    this.onTap,
    this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Ink(
        padding: EdgeInsets.all(6.r),
        width: 1.sw,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Container(
              height: 90.h,
              width: 90.w,
              margin: EdgeInsets.only(right: 12.r),
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.grey[100],
              ),
              child: CachedNetworkImage(
                imageUrl: menu.image ?? DataConst.noImage,
                useOldImageOnUrlChange: true,
                fit: BoxFit.contain,
                errorWidget: (context, url, error) {
                  return CachedNetworkImage(
                    imageUrl: DataConst.noImage,
                    useOldImageOnUrlChange: true,
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 7.5.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        flex: 7,
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              menu.name ?? '',
                              style: AppStyle.f18TextW500Black,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            5.verticalSpace,
                            Text(
                              'Rp ${menu.price}',
                              style: AppStyle.f16TextW600Black,
                            ),
                          ],
                        )),
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            ImageConstant.ic_catatan,
                            fit: BoxFit.cover,
                          ),
                          2.5.horizontalSpaceRadius,
                          Expanded(
                            child: Text(
                              (menu.catatan != '')
                                  ? menu.catatan
                                  : 'tambahkan catatan',
                              style: Get.textTheme.bodySmall,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 75.r,
              padding: EdgeInsets.only(left: 12.r, right: 5.r),
              child: InkWell(
                splashFactory: NoSplash.splashFactory,
                child: QuantityCounter(
                  quantity: menu.jumlah,
                  onIncrement: onIncrement,
                  onDecrement: onDecrement,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
