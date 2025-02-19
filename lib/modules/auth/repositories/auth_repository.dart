import 'package:delivery_food/helper/services/dio_services.dart';
import 'package:delivery_food/helper/services/hive_services.dart';
import 'package:delivery_food/modules/auth/models/user_model.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  Future<RegisterModel> register({
    required String username,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    final dio = DioServices.call();
    final url =
        "/register?username=$username&phone=$phone&password=$password&password_confirmation=$confirmPassword";

    try {
      final response = await dio.post(url);
      Map<String, dynamic> responseData = response.data;
      HiveService.saveBearerToken(responseData['access_token']);
      return RegisterModel.fromJson(responseData);
    } on DioException catch (ex) {
      Map<String, dynamic> responseData = ex.response?.data;
      var errors = Errors.fromJson(responseData['errors']);
      return RegisterModel(
        status: ex.response?.statusCode ?? 0,
        errors: errors,
      );
    }
  }
}
