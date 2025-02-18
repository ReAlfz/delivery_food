import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/constants/assets_const.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        extendBody: false,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  AssetsConst.logo,
                  fit: BoxFit.cover,
                  height: 185,
                  width: 185,
                ),
              ),
              Text(
                'Masuk untuk melanjutkan',
                style: AppStyle.f24PrimaryW600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
