import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();

  var index = RxInt(0);

  void changeIndex(int newIndex) {
    index.value = newIndex;
  }
}
