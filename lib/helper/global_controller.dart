import 'package:delivery_food/modules/auth/models/user_model.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();

  var auth = Rxn<AuthModel>(null);
}
