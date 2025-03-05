import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/constants/assets_const.dart';
import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/helper/widgets/quantity_widget.dart';
import 'package:delivery_food/helper/widgets/tile_option_widget.dart';
import 'package:delivery_food/modules/detail_menu/controllers/detail_menu_controller.dart';
import 'package:delivery_food/modules/home/models/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailMenuWidget extends StatelessWidget {
  final MenuModel menu;
  const DetailMenuWidget({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    var globalController = GlobalController.to;
    var detailMenuController = DetailMenuController.to;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        24.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              menu.name ?? '',
              softWrap: true,
              style: AppStyle.f18TextW600Black.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
            QuantityWidget(
              quantity: menu.quantity,
              onDecrement: () => globalController.decrementQuantity(
                menu: menu,
                specificFunc: () => detailMenuController.detailMenu.refresh(),
              ),
              onIncrement: () => globalController.incrementQuantity(
                menu: menu,
                specificFunc: () => detailMenuController.detailMenu.refresh(),
              ),
            ),
          ],
        ),
        16.verticalSpace,
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 0.8.sw),
          child: Text(
            menu.description ?? '',
            softWrap: true,
            style: AppStyle.f12TextW500Black,
          ),
        ),
        8.verticalSpace,
        const Divider(),
        TileOptionWidget(
          title: 'Price',
          message: 'Rp. ${menu.price}',
          svgPicture: AssetsConst.priceIcon,
          titleStyle: AppStyle.f16TextW600Black.copyWith(
            fontWeight: FontWeight.bold,
          ),
          messageStyle: AppStyle.f16TextW600Black.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
        ),
        const Divider(),
        TileOptionWidget(
          title: 'Topping',
          message: menu.topping?.first.name,
          svgPicture: AssetsConst.toppingIcon,
          titleStyle: AppStyle.f16TextW600Black.copyWith(
            fontWeight: FontWeight.bold,
          ),
          messageStyle: AppStyle.f16TextW600Black.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Divider(),
        TileOptionWidget(
          title: 'Note',
          message: '...',
          svgPicture: AssetsConst.noteIcon,
          titleStyle: AppStyle.f16TextW600Black.copyWith(
            fontWeight: FontWeight.bold,
          ),
          messageStyle: AppStyle.f16TextW600Black.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
