import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/modules/menu/detail_menu/models/detail_menu_response.dart';
import 'package:delivery_food/modules/menu/detail_menu/repositories/detail_menu_repository.dart';
import 'package:delivery_food/modules/menu/detail_menu/view/components/note_sheet.dart';
import 'package:delivery_food/modules/menu/detail_menu/view/components/topping_sheet.dart';
import 'package:delivery_food/modules/menu/list_menu/controllers/menu_controller.dart';
import 'package:delivery_food/modules/menu/list_menu/models/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailMenuController extends GetxController {
  static DetailMenuController get to => Get.find();
  RxList<dynamic> selectedTopping = RxList.empty();
  var isLoading = RxBool(false);
  var detailMenu = Rxn<MenuModel>();
  var noteTextController = TextEditingController();

  @override
  @override
  void onInit() async {
    isLoading.value = true;
    final int idMenu = Get.arguments;
    var detailMenuResponse =
        await DetailMenuRepository.getDetailMenu(id: idMenu);

    if (detailMenuResponse.status == 200) {
      detailMenu.value = detailMenuResponse.data;
      final index = GlobalController.to.selectedMenuList
          .indexWhere((item) => item.id == detailMenu.value!.id);

      if (index != -1) {
        detailMenu.value = detailMenuResponse.data!.copyWith(
          quantity: GlobalController.to.selectedMenuList[index].quantity,
          note: GlobalController.to.selectedMenuList[index].note,
        );
        selectedTopping.value =
            GlobalController.to.selectedMenuList[index].topping!;
      }
    } else if (detailMenuResponse.status == 401) {
      GlobalController.to.expiredTokenHandler();
    }
    isLoading.value = false;
    super.onInit();
  }

  void showOption({required String option}) async {
    if (option == 'topping') {
      Get.bottomSheet(
        const ToppingSheet(),
      );
    } else {
      final data = await Get.bottomSheet(
        const NoteSheet(),
      );
      detailMenu.value?.note = data;
      detailMenu.refresh();
    }
  }

  void addToCart() {
    var menu = detailMenu.value!.copyWith(
      topping: selectedTopping,
    );

    final index = GlobalController.to.selectedMenuList
        .indexWhere((item) => item.id == detailMenu.value!.id);

    if (index != -1) {
      GlobalController.to.selectedMenuList[index] = menu;

      final homeIndex = HomeController.to.currentList
          .indexWhere((item) => item.id == menu.id);
      HomeController.to.currentList[homeIndex] = menu;
    }
  }

  bool getSelected(ToppingMenu topping) => selectedTopping.contains(topping);
}
