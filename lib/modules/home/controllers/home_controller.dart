import 'package:delivery_food/helper/services/hive_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  void delete() {
    HiveService.clearAuth();
  }
}
