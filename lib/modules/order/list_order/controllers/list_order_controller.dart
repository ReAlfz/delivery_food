import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/modules/order/list_order/models/list_order_response.dart';
import 'package:delivery_food/modules/order/list_order/repositories/list_order_repository.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ListOrderController extends GetxController {
  static ListOrderController get to => Get.find();

  var isLoading = RxBool(false);
  var currentListOrderKey = RxInt(0);
  var refreshController = RefreshController(initialRefresh: false);
  Map<int, RxList<OrderModel>> orderList = {
    0: RxList<OrderModel>.empty(),
    1: RxList<OrderModel>.empty(),
  };

  Map<int, RxInt> currentPage = {
    0: RxInt(1),
    1: RxInt(1),
  };

  Map<int, RxBool> canLoadmore = {
    0: RxBool(true),
    1: RxBool(true),
  };

  @override
  void onInit() async {
    fetching(selectedList: 0, endpoint: 'ongoing');
    fetching(selectedList: 1, endpoint: 'history');
    super.onInit();
  }

  Future<void> onRefreshOrder() async {
    isLoading.value = true;
    canLoadmore[currentListOrderKey.value]?.value = true;
    currentPage[currentListOrderKey.value]?.value = 1;

    String endpoint = currentListOrderKey.value == 0 ? 'ongoing' : 'history';
    var orderData = await ListOrderRepository.getOrder(
      page: 1,
      endpoint: endpoint,
    );

    if (orderData.status == 200) {
      orderList[currentListOrderKey.value]?.value = orderData.data!;
      refreshController.refreshCompleted();
      refreshController.loadComplete();
    } else if (orderData.status == 401) {
      refreshController.refreshFailed();
      GlobalController.to.expiredTokenHandler();
    }
    isLoading.value = false;
  }

  Future<void> onLoadingOrder() async {
    canLoadmore[currentListOrderKey.value]?.value = true;
    currentPage[currentListOrderKey.value]?.value += 1;

    String endpoint = currentListOrderKey.value == 0 ? 'ongoing' : 'history';
    var orderData = await ListOrderRepository.getOrder(
      page: currentPage[currentListOrderKey.value]!.value,
      endpoint: endpoint,
    );

    if (orderData.status == 200) {
      orderList[currentListOrderKey.value]?.value = orderData.data!;
      refreshController.loadComplete();
    } else if (orderData.status == 401) {
      refreshController.loadFailed();
      GlobalController.to.expiredTokenHandler();
    } else if (orderData.status == 204) {
      canLoadmore[currentListOrderKey.value]?.value = false;
      refreshController.loadNoData();
    }
  }

  Future<void> fetching({
    required int selectedList,
    required String endpoint,
  }) async {
    isLoading.value = true;
    var orderData = await ListOrderRepository.getOrder(
      page: currentPage[selectedList]!.value,
      endpoint: endpoint,
    );
    if (orderData.status == 200) {
      orderList[selectedList]?.value = orderData.data!;
    } else if (orderData.status == 401) {
      GlobalController.to.expiredTokenHandler();
    }
    isLoading.value = false;
  }
}
