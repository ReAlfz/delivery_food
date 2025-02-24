import 'package:delivery_food/config/route.dart';
import 'package:delivery_food/helper/services/hive_services.dart';
import 'package:delivery_food/modules/auth/models/user_model.dart';
import 'package:delivery_food/modules/home/models/menu_model.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();

  var keyword = RxString('');
  var auth = Rxn<AuthModel>(null);
  RxList<MenuModel> listMenu = RxList.empty();

  void expiredTokenHandler() {
    HiveService.clearAuth();
    auth.value = null;
    Get.offAndToNamed(AppRoutes.loginView);
  }
}
