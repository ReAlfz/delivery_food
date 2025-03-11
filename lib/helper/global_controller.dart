import 'package:delivery_food/config/route.dart';
import 'package:delivery_food/helper/services/hive_services.dart';
import 'package:delivery_food/helper/widgets/message_widget.dart';
import 'package:delivery_food/modules/auth/models/user_model.dart';
import 'package:delivery_food/modules/menu/list_menu/models/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();
  RxList<MenuModel> selectedMenuList = RxList.empty();
  var auth = Rxn<AuthModel>(null);

  void expiredTokenHandler({String? message}) {
    HiveService.clearAuth();
    auth.value = null;
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: MessageWidget(
          text:
              message ?? "This account session has expired, please login again",
          onTap: () => Get.offAndToNamed(AppRoutes.loginView),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void incrementQuantity({
    required MenuModel menu,
    RxList? currentList,
    Function()? specificFunc,
  }) {
    int index = selectedMenuList.indexWhere((item) => item.id == menu.id);
    if (index != -1) {
      menu.quantity = menu.quantity + 1;
      selectedMenuList[index].quantity = menu.quantity;
    } else {
      menu.quantity = 1;
      selectedMenuList.add(menu);
    }

    selectedMenuList.refresh();
    currentList?.refresh();
    specificFunc?.call();
  }

  void decrementQuantity({
    required MenuModel menu,
    RxList? currentList,
    Function()? specificFunc,
  }) {
    int index = selectedMenuList.indexWhere((item) => item.id == menu.id);
    if (index != -1) {
      menu.quantity = menu.quantity - 1;
      selectedMenuList[index].quantity = menu.quantity;

      if (menu.quantity == 0) selectedMenuList.removeAt(index);
    }

    selectedMenuList.refresh();
    currentList?.refresh();
    specificFunc?.call();
  }
}
