import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/modules/auth/models/user_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  var savingStatus = RxBool(false);
  var auth = Rxn<UserModel>();

  @override
  void onInit() {
    auth.value = GlobalController.to.auth.value?.users;
    super.onInit();
  }

  void change() => savingStatus.value = !savingStatus.value;
}
