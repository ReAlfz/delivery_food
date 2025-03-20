import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/modules/order/detail_order/repositories/detail_order_repository.dart';
import 'package:delivery_food/modules/order/list_order/models/list_order_response.dart';
import 'package:get/get.dart';

class DetailOrderController extends GetxController {
  static DetailOrderController get to => Get.find();

  var status = RxBool(false);
  var orderData = Rxn<OrderModel>();
  int orderId = 0;

  @override
  void onInit() async {
    orderId = Get.arguments as int;
    await fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    var orderResponse = await DetailOrderRepository.getOrderDetail(id: orderId);
    if (orderResponse.status == 200) {
      orderData.value = orderResponse.data!;
    } else if (orderResponse.status == 401) {
      GlobalController.to.expiredTokenHandler();
    }
  }
}
