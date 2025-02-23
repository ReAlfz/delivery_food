import 'package:delivery_food/helper/widgets/loading_widget.dart';
import 'package:delivery_food/modules/auth/repositories/auth_repository.dart';
import 'package:delivery_food/modules/auth/view/components/register_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find();

  var fromKey = GlobalKey<FormState>();
  var userController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();

  var usernameErrors = RxnString(null);
  var phoneErrors = RxnString(null);
  var passwordErrors = RxnString(null);
  var confirmErrors = RxnString(null);

  late final AuthRepository authRepository;
  var submited = false.obs;

  @override
  void onInit() {
    authRepository = AuthRepository();
    super.onInit();
  }

  void validateRegister() async {
    usernameErrors.value = null;
    phoneErrors.value = null;
    passwordErrors.value = null;
    confirmErrors.value = null;

    var isValid = fromKey.currentState!.validate();
    Get.focusScope!.unfocus();

    if (isValid) {
      showLoading();
      var response = await authRepository.register(
        username: userController.text,
        phone: phoneController.text,
        password: passwordController.text,
        confirmPassword: confirmController.text,
      );

      if (response.status == 201) {
        hideLoading();
        Get.dialog(
          const Dialog(
            backgroundColor: Colors.transparent,
            child: RegisterDialog(),
          ),
          barrierDismissible: false,
        );

        return;
      }

      submited(true);

      usernameErrors(response.errors?.username);
      phoneErrors(response.errors?.phone);
      if (response.errors?.password != null &&
          response.errors!.password!.contains('confirmation')) {
        confirmErrors(response.errors?.password);
      } else {
        passwordErrors(response.errors?.password);
      }

      hideLoading();
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
