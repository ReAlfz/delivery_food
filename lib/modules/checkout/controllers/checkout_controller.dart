import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/modules/checkout/repositories/checkout_repository.dart';
import 'package:delivery_food/modules/checkout/view/components/voucher_sheet.dart';
import 'package:delivery_food/modules/home/models/voucher_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckoutController extends GetxController {
  static CheckoutController get to => Get.find();

  var selectedVoucher = Rxn<VoucherModel>();

  int getPrice() {
    return GlobalController.to.selectedMenuList.isNotEmpty
        ? GlobalController.to.selectedMenuList
            .map((item) => item.price! * item.quantity)
            .reduce((a, b) => a + b)
        : 0;
  }

  String intlConvert(num price) {
    return NumberFormat.currency(
      decimalDigits: 0,
      symbol: 'Rp. ',
    ).format(price);
  }

  int getDiscount() {
    if (selectedVoucher.value != null) {
      return selectedVoucher.value!.isDiscount!
          ? selectedVoucher.value?.price ?? 0
          : selectedVoucher.value?.price ?? 0;
    } else {
      return 0;
    }
  }

  num getGrandTotalPrice() {
    if (selectedVoucher.value != null) {
      var price = selectedVoucher.value!.isDiscount!
          ? getPrice() * (1 - selectedVoucher.value!.price! / 100)
          : getPrice() - selectedVoucher.value!.price!;
      return price;
    }
    return getPrice();
  }

  void selectDiscount() async {
    var data = await Get.bottomSheet(
      const VoucherSheet(),
    );

    if (data != null) selectedVoucher.value = data as VoucherModel;
  }

  void createOrder() async {
    await CheckoutRepository.createOrder(
      price: getGrandTotalPrice(),
      discount: getDiscount(),
      listMenu: GlobalController.to.selectedMenuList,
    );
  }
}
