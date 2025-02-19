import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  var fromKey = GlobalKey<FormState>();
  var hpController = TextEditingController();
  var passwordController = TextEditingController();
}
