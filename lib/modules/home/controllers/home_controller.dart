import 'dart:developer';

import 'package:delivery_food/helper/services/hive_services.dart';
import 'package:delivery_food/modules/home/models/menu_model.dart';
import 'package:delivery_food/modules/home/repositories/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var keyword = RxString('');
  var isLoading = RxBool(false);
  RxList<MenuModel> menuData = RxList.empty();

  Future<void> refreshHome() async {
    isLoading.value = true;

    var response = await HomeRepository.getMenu(page: 1);
    log(response.status.toString());
    if (response.status == 200) {
      menuData.value = response.data!;
    } else if (response.status == 401) {}
    isLoading.value = false;
  }

  void delete() {
    HiveService.clearAuth();
  }
}
