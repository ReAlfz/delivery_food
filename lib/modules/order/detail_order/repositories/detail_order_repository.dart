import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/helper/services/dio_services.dart';
import 'package:delivery_food/modules/order/detail_order/model/detail_order_response.dart';
import 'package:dio/dio.dart';

class DetailOrderRepository {
  static Future<DetailOrderResponse> getOrderDetail({required int id}) async {
    final token = 'Bearer ${GlobalController.to.auth.value?.accessToken}';
    final url = "/order/detail/$id";
    final dio = DioServices.call(authorization: token);

    try {
      final response = await dio.get(url);
      Map<String, dynamic> responseData = response.data;
      return DetailOrderResponse.fromJson(responseData);
    } on DioException catch (ex) {
      return DetailOrderResponse(
        status: ex.response?.statusCode ?? 0,
        message: ex.response?.data,
      );
    }
  }
}
