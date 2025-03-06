import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/data_const.dart';
import 'package:delivery_food/helper/widgets/custom_appbar.dart';
import 'package:delivery_food/modules/detail_menu/controllers/detail_menu_controller.dart';
import 'package:delivery_food/modules/detail_menu/view/components/detail_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailMenuView extends StatelessWidget {
  const DetailMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    var detailMenuController = DetailMenuController.to;
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        detailMenuController.addToCart();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppbar(
          text: 'Detail Menu',
          enableBack: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 3,
              child: Obx(() {
                return Padding(
                  padding: EdgeInsets.all(8.r),
                  child: CachedNetworkImage(
                    imageUrl: detailMenuController.detailMenu.value?.image ??
                        DataConst.noImage,
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
                );
              }),
            ),
            Expanded(
              flex: 6,
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.r),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(111, 24, 24, 24),
                        blurRadius: 15,
                        spreadRadius: -1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Obx(() {
                    if (detailMenuController.isLoading.value == false) {
                      return DetailMenuWidget(
                        menu: detailMenuController.detailMenu.value!,
                      );
                    } else {
                      return const SizedBox(width: double.infinity);
                    }
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
