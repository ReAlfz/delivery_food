import 'package:delivery_food/config/pages.dart';
import 'package:delivery_food/config/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Delivery Foods',
          debugShowCheckedModeBanner: false,
          getPages: AppPages.pages(),
          initialRoute: AppRoutes.splashScreenView,
          scrollBehavior: ScrollConfiguration.of(context).copyWith(
            physics: const BouncingScrollPhysics(),
          ),
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: false,
            fontFamily: 'Poppins',
          ),
        );
      },
    );
  }
}
