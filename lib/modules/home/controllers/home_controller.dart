// ignore_for_file: invalid_use_of_protected_member

import 'package:delivery_food/config/route.dart';
import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/helper/services/debouncer.dart';
import 'package:delivery_food/modules/home/models/menu_model.dart';
import 'package:delivery_food/modules/home/models/voucher_model.dart';
import 'package:delivery_food/modules/home/repositories/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  var debouncer = Debouncer(delay: const Duration(milliseconds: 500));
  var isLoading = RxBool(false);
  RxList<VoucherModel> listVoucher = RxList.empty();

  var refreshController = RefreshController(initialRefresh: false);
  Map<String, RxBool> canLoadMore = {
    'Foods': RxBool(true),
    'Drinks': RxBool(true),
    'Snacks': RxBool(true),
  };

  RxList<MenuModel> get currentList =>
      categoryList[currentCategory.value] ?? RxList.empty();
  Map<String, RxList<MenuModel>> categoryList = {
    'Foods': RxList<MenuModel>.empty(),
    'Drinks': RxList<MenuModel>.empty(),
    'Snacks': RxList<MenuModel>.empty(),
  };

  Map<String, RxInt> currentPage = {
    'Foods': 1.obs,
    'Drinks': 1.obs,
    'Snacks': 1.obs,
  };

  @override
  void onInit() async {
    var voucherData = await HomeRepository.getVoucher();
    if (voucherData.status == 200) {
      listVoucher.value = voucherData.data!;
    }

    await initList(
      categoryMapping.keys.elementAt(0),
      categoryMapping.values.elementAt(0),
    );
    await initList(
      categoryMapping.keys.elementAt(1),
      categoryMapping.values.elementAt(1),
    );
    await initList(
      categoryMapping.keys.elementAt(2),
      categoryMapping.values.elementAt(2),
    );
    super.onInit();
  }

  Future<void> initList(String mapKey, String mapValue) async {
    isLoading.value = true;
    var homeData = await HomeRepository.getMenu(
      page: 1,
      category: mapValue,
    );

    if (homeData.status == 200) {
      categoryList[mapKey]?.value = homeData.data!;
      refreshController.refreshCompleted();
      refreshController.loadComplete();
    } else if (homeData.status == 401) {
      refreshController.loadFailed();
      GlobalController.to.expiredTokenHandler();
    }
    isLoading.value = false;
  }

  Future<void> refreshHome() async {
    isLoading.value = true;
    canLoadMore[currentCategory.value]?.value = true;
    currentPage[currentCategory.value]!.value = 1;
    var homeData = await HomeRepository.getMenu(
      page: currentPage[currentCategory.value]!.value,
      category: categoryMapping[currentCategory.value],
    );

    if (homeData.status == 200) {
      categoryList[currentCategory.value]?.value = homeData.data!;
      for (var selectMenu in GlobalController.to.selectedMenuList) {
        int index = categoryList[currentCategory.value]
                ?.value
                .indexWhere((item) => item.id == selectMenu.id) ??
            -1;
        if (index != -1) {
          categoryList[currentCategory.value]?.value[index].quantity =
              selectMenu.quantity;
        }
      }
      refreshController.refreshCompleted();
      refreshController.loadComplete();
    } else if (homeData.status == 401) {
      refreshController.loadFailed();
      GlobalController.to.expiredTokenHandler();
    }
    isLoading.value = false;
  }

  Future<void> onLoadingHome() async {
    canLoadMore[currentCategory.value]?.value = true;
    currentPage[currentCategory.value]!.value += 1;

    var homeData = await HomeRepository.getMenu(
      page: currentPage[currentCategory.value]!.value,
      category: categoryMapping[currentCategory.value],
    );

    if (homeData.status == 200) {
      categoryList[currentCategory.value]?.addAll(homeData.data!);
      refreshController.loadComplete();
    } else if (homeData.status == 204) {
      canLoadMore[currentCategory.value]?.value = false;
      refreshController.loadNoData();
    } else if (homeData.status == 401) {
      refreshController.loadFailed();
      GlobalController.to.expiredTokenHandler();
    }
    isLoading.value = false;
  }

  var currentCategory = RxString('Foods');
  final Map<String, String> categoryMapping = {
    'Foods': 'makanan',
    'Drinks': 'minuman',
    'Snacks': 'snack',
  };

  final Map<String, IconData> iconCategory = {
    'Foods': Icons.food_bank_outlined,
    'Drinks': Icons.local_drink_outlined,
    'Snacks': Icons.no_food_outlined,
  };

  void changeCurrentCategory(String value) {
    currentCategory.value = value;
    refreshController.resetNoData();
  }

  bool loadMoreStatus() => canLoadMore[currentCategory.value]!.value;
  void goToSearch() => Get.toNamed(AppRoutes.searchView);
  void goToCheckout() => Get.toNamed(AppRoutes.checkoutView);
  void goToDetail(int id) => Get.toNamed(
        AppRoutes.detailMenuView,
        arguments: id,
      );

  RxList<MenuModel> searchList = RxList.empty();
  void onSearch(String value) {
    if (value.length > 2) {
      debouncer.call(() async {
        var searchData = await HomeRepository.getMenuSearch(keyword: value);
        if (searchData.status == 200) {
          searchList.value = searchData.data ?? [];
        } else if (searchData.status == 401) {
          GlobalController.to.expiredTokenHandler();
        } else if (searchData.status == 403) {
          searchList.value = [];
        }
      });
    } else {
      searchList.value = [];
    }
  }

  @override
  void onClose() {
    debouncer.dispose();
    super.onClose();
  }
}
