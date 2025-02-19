import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/constants/assets_const.dart';
import 'package:delivery_food/helper/widgets/custom_app_button.dart';
import 'package:delivery_food/modules/auth/controllers/register_controller.dart';
import 'package:delivery_food/modules/auth/view/components/register_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                30.verticalSpace,
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
                  'Fill out to register',
                  textAlign: TextAlign.center,
                  style: AppStyle.f24PrimaryW600,
                ),
                60.verticalSpace,
                const RegisterForm(),
                60.verticalSpace,
                CustomAppButton(
                  text: 'Register',
                  color: AppColor.primaryColor,
                  onTap: () => RegisterController.to.validateRegister(),
                ),
                30.verticalSpace,
                Text.rich(
                  textAlign: TextAlign.center,
                  style: AppStyle.f14TextW500Black,
                  TextSpan(
                    text: "Already have an account?, ",
                    children: [
                      TextSpan(
                        text: 'Login here',
                        style: AppStyle.f14PrimaryW500,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.back();
                          },
                      )
                    ],
                  ),
                ),
                30.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
