import 'package:delivery_food/config/route.dart';
import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/helper/services/hive_services.dart';
import 'package:delivery_food/helper/widgets/loading_widget.dart';
import 'package:delivery_food/helper/widgets/message_widget.dart';
import 'package:delivery_food/modules/auth/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  var fromKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  void login() async {
    showLoading();

    var isValid = fromKey.currentState!.validate();
    Get.focusScope!.unfocus();

    if (isValid) {
      var authData = await AuthRepository.login(
        phone: phoneController.text,
        password: passwordController.text,
      );

      if (authData.status == 200) {
        hideLoading();
        HiveService.saveAuth(authData);
        GlobalController.to.auth.value = authData;
        Get.offAllNamed(AppRoutes.dashboardView);
        return;
      }

      hideLoading();
      Get.dialog(
        Dialog(
          backgroundColor: Colors.transparent,
          child: MessageWidget(
            text: authData.errors ?? '',
            onTap: () => Get.back(),
          ),
        ),
        barrierDismissible: true,
      );
    }
  }

  void showLoading() {
    Get.dialog(
      Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 0.3.sw),
        backgroundColor: Colors.transparent,
        child: const LoadingWidget(),
      ),
      barrierDismissible: false,
    );
  }

  void hideLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
