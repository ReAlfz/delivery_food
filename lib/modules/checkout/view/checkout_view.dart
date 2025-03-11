import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/helper/widgets/custom_appbar.dart';
import 'package:delivery_food/modules/checkout/view/components/detail_transaction_widget.dart';
import 'package:delivery_food/modules/menu/list_menu/controllers/menu_controller.dart';
import 'package:delivery_food/modules/menu/list_menu/view/components/menu_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    var globalController = GlobalController.to;
    return Scaffold(
      appBar: const CustomAppbar(
        text: 'Checkout',
        enableBack: true,
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.fromLTRB(10.w, 8.h, 10.w, 0),
          child: ListView.separated(
            itemCount: globalController.selectedMenuList.length,
            separatorBuilder: (context, index) => 8.verticalSpace,
            itemBuilder: (context, index) {
              var menu = globalController.selectedMenuList[index];
              return MenuCardWidget(
                menu: menu,
                onIncrement: () => globalController.incrementQuantity(
                  menu: menu,
                  currentList: HomeController.to.currentList,
                ),
                onDecrement: () => globalController.decrementQuantity(
                  menu: menu,
                  currentList: HomeController.to.currentList,
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const DetailTransactionWidget(),
    );
  }
}
