import 'package:delivery_food/helper/services/dio_services.dart';
import 'package:delivery_food/modules/auth/models/user_model.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  static Future<AuthModel> register({
    required String username,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    final dio = DioServices.call();
    const url = "/register";

    try {
      final Map<String, String> data = {
        "username": username,
        "phone": phone,
        "password": password,
        "password_confirmation": confirmPassword,
      };
      final response = await dio.post(url, data: data);
      Map<String, dynamic> responseData = response.data;
      return AuthModel.fromJson(responseData);
    } on DioException catch (ex) {
      return AuthModel(errors: ex.response?.statusCode);
    }
  }

  static Future<AuthModel> login({
    required String phone,
    required String password,
  }) async {
    final dio = DioServices.call();
    const url = '/login';

    try {
      final Map<String, String> data = {
        "phone": phone,
        "password": password,
      };
      final response = await dio.post(url, data: data);
      Map<String, dynamic> responseData = response.data;
      return AuthModel.fromJson(responseData);
    } on DioException catch (ex) {
      return AuthModel(errors: ex.response?.statusCode);
    }
  }
}
