import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/helper/services/dio_services.dart';
import 'package:delivery_food/modules/home/models/home_model.dart';
import 'package:delivery_food/modules/home/models/voucher_model.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  static Future<HomeResponse> getMenu({
    required int page,
    String? category,
  }) async {
    String token = "Bearer ${GlobalController.to.auth.value!.accessToken}";
    final url = '/menu/$page/$category';
    final dio = DioServices.call(authorization: token);

    try {
      final response = await dio.get(url);
      Map<String, dynamic> responseData = response.data;
      return HomeResponse.fromJson(responseData);
    } on DioException catch (ex) {
      return HomeResponse(
        status: ex.response?.statusCode ?? 0,
      );
    }
  }

  static Future<VoucherResponse> getVoucher() async {
    String token = "Bearer ${GlobalController.to.auth.value!.accessToken}";
    const url = '/voucher';
    final dio = DioServices.call(authorization: token);

    try {
      final response = await dio.get(url);
      Map<String, dynamic> responseData = response.data;
      return VoucherResponse.fromJson(responseData);
    } on DioException catch (ex) {
      return VoucherResponse(
        status: ex.response?.statusCode ?? 0,
      );
    }
  }
}
