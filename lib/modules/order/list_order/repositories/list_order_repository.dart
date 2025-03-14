import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/helper/services/dio_services.dart';
import 'package:delivery_food/modules/order/list_order/models/list_order_response.dart';
import 'package:dio/dio.dart';

class ListOrderRepository {
  static Future<ListOrderResponse> getOrder({
    required int page,
    required String endpoint,
  }) async {
    final token = 'Bearer ${GlobalController.to.auth.value?.accessToken}';
    final userId = GlobalController.to.auth.value?.users?.id;
    final url = "/order/$endpoint/$userId/$page";
    final dio = DioServices.call(authorization: token);

    try {
      final response = await dio.get(url);
      Map<String, dynamic> responseData = response.data;
      return ListOrderResponse.fromJson(responseData);
    } on DioException catch (ex) {
      return ListOrderResponse(
        status: ex.response?.statusCode ?? 0,
        message: ex.response?.data,
      );
    }
  }
}
