import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/modules/detail_menu/repositories/detail_menu_repository.dart';
import 'package:delivery_food/modules/home/models/menu_model.dart';
import 'package:get/get.dart';

class DetailMenuController extends GetxController {
  static DetailMenuController get to => Get.find();
  Rxn<MenuModel> detailMenu = Rxn<MenuModel>();
  RxBool isLoading = RxBool(false);

  @override
  void onInit() async {
    isLoading.value = true;
    final int idMenu = Get.arguments;
    var detailMenuResponse =
        await DetailMenuRepository.getDetailMenu(id: idMenu);

    if (detailMenuResponse.status == 200) {
      detailMenu.value = detailMenuResponse.data;
    } else if (detailMenuResponse.status == 401) {
      GlobalController.to.expiredTokenHandler();
    }
    isLoading.value = false;
    super.onInit();
  }
}
