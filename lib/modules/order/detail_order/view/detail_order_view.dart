import 'package:delivery_food/modules/menu/list_menu/view/components/menu_item.dart';
import 'package:delivery_food/modules/order/detail_order/controllers/detail_order_controller.dart';
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
      body: Obx(
        () => Conditional.single(
          context: context,
          conditionBuilder: (context) => detailController.status.value,
          fallbackBuilder: (context) => const SizedBox(),
          widgetBuilder: (context) {
            return ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) => 8.verticalSpace,
              itemBuilder: (context, index) {
                var menu = detailController.orderData.value!.menu![index];
                return MenuItem(menu: menu);
              },
            );
          },
        ),
      ),
    );
  }
}
