import 'package:delivery_food/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:delivery_food/modules/home/controllers/home_controller.dart';
import 'package:delivery_food/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(ProfileController());
  }
}
