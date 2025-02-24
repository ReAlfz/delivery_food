import 'package:delivery_food/config/route.dart';
import 'package:delivery_food/helper/services/hive_services.dart';
import 'package:delivery_food/modules/auth/models/user_model.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();

  var auth = Rxn<AuthModel>(null);

  void expiredTokenHandler() {
    HiveService.clearAuth();
    auth.value = null;
    Get.offAndToNamed(AppRoutes.loginView);
  }
}
