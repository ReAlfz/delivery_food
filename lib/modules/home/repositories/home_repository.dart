import 'dart:convert';

import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/helper/services/dio_services.dart';
import 'package:delivery_food/modules/home/models/home_model.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  Future<HomeResponse> getMenu({required int page}) async {
    String token = "Barier ${GlobalController.to.auth.value!.accessToken}";
    final url = '/menu/page/$page';
    final dio = DioServices.call(authorization: token);

    try {
      final response = await dio.get(url);
      return HomeResponse.fromJson(jsonDecode(response.data));
    } on DioException catch (ex) {
      return HomeResponse(
        status: ex.response?.statusCode ?? 0,
      );
    }
  }
}
