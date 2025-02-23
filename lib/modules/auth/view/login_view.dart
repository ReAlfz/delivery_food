import 'package:delivery_food/config/route.dart';
import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/constants/assets_const.dart';
import 'package:delivery_food/helper/widgets/custom_app_button.dart';
import 'package:delivery_food/modules/auth/controllers/login_controller.dart';
import 'package:delivery_food/modules/auth/view/components/login_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        extendBody: false,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      AssetsConst.logo,
                      fit: BoxFit.cover,
                      height: 185,
                      width: 185,
                    ),
                  ),
                ),
                Text(
                  'Log in to continue',
                  textAlign: TextAlign.center,
                  style: AppStyle.f24PrimaryW600,
                ),
                100.verticalSpace,
                const LoginForm(),
                60.verticalSpace,
                CustomAppButton(
                  text: 'Login',
                  color: AppColor.primaryColor,
                  onTap: LoginController.to.login,
                ),
                30.verticalSpace,
                Text.rich(
                  textAlign: TextAlign.center,
                  style: AppStyle.f14TextW500Black,
                  TextSpan(
                    text: "Don't have an account?, ",
                    children: [
                      TextSpan(
                        text: 'Register here',
                        style: AppStyle.f14PrimaryW500,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(AppRoutes.registerView);
                          },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
