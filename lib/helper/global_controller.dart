import 'package:delivery_food/config/route.dart';
import 'package:delivery_food/helper/services/hive_services.dart';
import 'package:delivery_food/helper/widgets/message_widget.dart';
import 'package:delivery_food/modules/auth/models/user_model.dart';
import 'package:delivery_food/modules/home/models/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();
  RxList selectedMenuList = RxList.empty();
  var auth = Rxn<AuthModel>(null);

  void expiredTokenHandler() {
    HiveService.clearAuth();
    auth.value = null;
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: MessageWidget(
          text: "This account session has expired, please login again",
          onTap: () => Get.offAndToNamed(AppRoutes.loginView),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void incrementQuantity({required MenuModel menu, RxList? currentList}) {
    if (!selectedMenuList.contains(menu)) {
      menu.quantity += 1;
      selectedMenuList.add(menu);
    } else {
      menu.quantity += 1;
    }
    selectedMenuList.refresh();
    currentList?.refresh();
  }

  void decrementQuantity({required MenuModel menu, RxList? currentList}) {
    if (menu.quantity > 1) {
      menu.quantity -= 1;
    } else {
      menu.quantity -= 1;
      selectedMenuList.remove(menu);
    }
    selectedMenuList.refresh();
    currentList?.refresh();
  }
}
