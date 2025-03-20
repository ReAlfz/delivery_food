import 'package:delivery_food/modules/order/detail_order/controllers/detail_order_controller.dart';
import 'package:get/get.dart';

class DetailOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailOrderController());
  }
}
