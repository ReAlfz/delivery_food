import 'package:delivery_food/modules/auth/controllers/register_controller.dart';
import 'package:delivery_food/modules/auth/view/components/textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = RegisterController.to;
    return Form(
      key: registerController.fromKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => TextformWidget(
                controller: registerController.userController,
                keyboardType: TextInputType.text,
                label: 'Username',
                hint: 'Alf',
                isObscure: false,
                errorText: registerController.submited.value
                    ? registerController.usernameErrors.value
                    : null,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username cannot empty';
                  }
                  return null;
                },
              )),
          20.verticalSpace,
          Obx(() => TextformWidget(
                controller: registerController.phoneController,
                keyboardType: TextInputType.number,
                label: 'Phone Number',
                hint: '087xxx',
                isObscure: false,
                errorText: registerController.submited.value
                    ? registerController.phoneErrors.value
                    : null,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone Number cannot empty';
                  }
                  return null;
                },
              )),
          20.verticalSpace,
          Obx(() => TextformWidget(
                controller: registerController.passwordController,
                keyboardType: TextInputType.text,
                label: 'Password',
                hint: '***',
                isObscure: true,
                errorText: registerController.submited.value
                    ? registerController.passwordErrors.value
                    : null,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password cannot empty';
                  }
                  return null;
                },
              )),
          20.verticalSpace,
          Obx(() => TextformWidget(
                controller: registerController.confirmController,
                keyboardType: TextInputType.text,
                label: 'Confirm Password',
                hint: '***',
                isObscure: true,
                errorText: registerController.submited.value
                    ? registerController.confirmErrors.value
                    : null,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm Password cannot empty';
                  }
                  return null;
                },
              )),
        ],
      ),
    );
  }
}
