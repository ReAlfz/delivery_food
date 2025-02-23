import 'dart:async';
import 'dart:developer';

import 'package:delivery_food/config/route.dart';
import 'package:delivery_food/constants/assets_const.dart';
import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/helper/services/hive_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<StatefulWidget> createState() => _SplashView();
}

class _SplashView extends State<SplashView> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () async {
        GlobalController.to.auth.value = HiveService.getAuth();
        log(GlobalController.to.auth.value?.accessToken ?? '');
        if (GlobalController.to.auth.value != null) {
          Get.offAndToNamed(AppRoutes.dashboardView);
        } else {
          Get.offAndToNamed(AppRoutes.loginView);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Image.asset(
          AssetsConst.logo,
          height: 185,
          width: 185,
        ),
      ),
    );
  }
}
