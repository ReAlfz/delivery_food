import 'package:delivery_food/modules/auth/controllers/login_controller.dart';
import 'package:delivery_food/modules/auth/view/components/textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: LoginController.to.fromKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextformWidget(
            controller: LoginController.to.hpController,
            keyboardType: TextInputType.number,
            label: 'No Telp',
            hint: '089xxx',
            isObscure: false,
          ),
          20.verticalSpace,
          TextformWidget(
            controller: LoginController.to.passwordController,
            keyboardType: TextInputType.text,
            label: 'Password',
            hint: '***',
            isObscure: true,
          ),
        ],
      ),
    );
  }
}
