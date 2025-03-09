import 'dart:developer';

import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/helper/services/dio_services.dart';
import 'package:delivery_food/modules/home/models/menu_model.dart';
import 'package:dio/dio.dart';

class CheckoutRepository {
  static Future<void> createOrder({
    required num price,
    required int discount,
    required List<MenuModel> listMenu,
  }) async {
    String token = "Bearer ${GlobalController.to.auth.value!.accessToken}";
    const url = '/order/add';
    final dio = DioServices.call(authorization: token);

    try {
      var data = {
        "potongan": discount,
        "total_price": price,
        "menu": listMenu.map((item) => orderConvert(item)).toList(),
      };

      await dio.post(url, data: data);
    } on DioException catch (ex) {
      log('status: ${ex.response?.statusCode}, error: ${ex.response?.data['errors']}');
    }
  }

  static Map<String, dynamic> orderConvert(MenuModel menu) {
    var topping = menu.topping?.map((topping) => topping.id).toList();

    return {
      "id_menu": menu.id,
      "quantity": menu.quantity,
      "note": menu.note ?? '',
      "topping": topping,
    };
  }
}
