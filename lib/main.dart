import 'package:delivery_food/app.dart';
import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/data_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('hive-prod');
  FlavorConfig(
    color: AppColor.primaryColor,
    variables: {
      "baseUrl": DataConst.apiDev,
      "localStorage": "hive-prod",
      "flavor": "production",
    },
  );
  runApp(const MyApp());
}
