import 'package:delivery_food/modules/auth/controllers/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
