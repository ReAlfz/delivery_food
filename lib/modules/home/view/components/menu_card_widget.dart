import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/constants/data_const.dart';
import 'package:delivery_food/helper/widgets/quantity_widget.dart';
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
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(8.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Ink(
          padding: EdgeInsets.all(6.r),
          width: 1.sw,
          height: 122.h,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Container(
                height: 100.h,
                width: 100.w,
                margin: EdgeInsets.only(right: 12.r),
                padding: EdgeInsets.all(8.r),
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                ),
              ),
              Container(
                height: 75.r,
                padding: EdgeInsets.only(left: 12.r, right: 5.r),
                child: InkWell(
                  splashFactory: NoSplash.splashFactory,
                  child: QuantityWidget(
                    quantity: menu.quantity,
                    onIncrement: onIncrement,
                    onDecrement: onDecrement,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
