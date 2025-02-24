import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/modules/home/models/menu_model.dart';
import 'package:delivery_food/modules/home/models/voucher_model.dart';
import 'package:delivery_food/modules/home/repositories/home_repository.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var keyword = RxString('');
  var isLoading = RxBool(false);
  RxList<MenuModel> listMenu = RxList.empty();
  RxList<VoucherModel> listVoucher = RxList.empty();

  var refreshController = RefreshController(initialRefresh: false);
  var canLoadMore = RxBool(true);
  int currentPage = 1;

  @override
  void onInit() async {
    var voucherData = await HomeRepository.getVoucher();
    listVoucher.value = voucherData.data!;
    await refreshHome();
    super.onInit();
  }

  Future<void> refreshHome() async {
    isLoading.value = true;
    var homeData = await HomeRepository.getMenu(page: 1);

    if (homeData.status == 200) {
      listMenu.value = homeData.data!;
      refreshController.loadComplete();
    } else if (homeData.status == 401) {
      refreshController.loadFailed();
      GlobalController.to.expiredTokenHandler();
    }
    isLoading.value = false;
  }

  Future<void> onLoadingHome() async {
    canLoadMore.value = true;
    currentPage += 1;

    var homeData = await HomeRepository.getMenu(page: currentPage);
    if (homeData.status == 200) {
      listMenu.value = homeData.data!;
      refreshController.loadComplete();
    } else if (homeData.status == 204) {
      canLoadMore.value = false;
      refreshController.loadNoData();
    } else if (homeData.status == 401) {
      refreshController.loadFailed();
      GlobalController.to.expiredTokenHandler();
    }
    isLoading.value = false;
  }
}
