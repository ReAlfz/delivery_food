import 'package:delivery_food/helper/global_controller.dart';
import 'package:delivery_food/helper/services/dio_services.dart';
import 'package:delivery_food/modules/menu/detail_menu/models/detail_menu_response.dart';
import 'package:dio/dio.dart';

class DetailMenuRepository {
  static Future<DetailMenuResponse> getDetailMenu({required int id}) async {
    String token = "Bearer ${GlobalController.to.auth.value!.accessToken}";
    final url = '/menu/detail/$id';
    final dio = DioServices.call(authorization: token);

    try {
      final response = await dio.get(url);
      Map<String, dynamic> responseData = response.data;
      return DetailMenuResponse.fromJson(responseData);
    } on DioException catch (ex) {
      return DetailMenuResponse(
        status: ex.response?.statusCode ?? 0,
      );
    }
  }
}
