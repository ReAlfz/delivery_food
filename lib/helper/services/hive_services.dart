import 'package:delivery_food/modules/auth/models/user_model.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:hive/hive.dart';

class HiveService {
  HiveService._();
  static const String bearerTokenKey = 'bearerTokenKey';
  static const String authUserKey = 'authKey';
  static final authHive = Hive.box(
    FlavorConfig.instance.variables['localStorage'],
  );

  static saveBearerToken(String token) {
    authHive.put(bearerTokenKey, token);
  }

  static String? getBearerToken() {
    return authHive.get(bearerTokenKey, defaultValue: "");
  }

  static saveAuth(UserModel user) {
    authHive.put(authUserKey, user);
  }

  static UserModel? getAuth() {
    return authHive.get(authUserKey) as UserModel;
  }

  static clearAuth() {
    authHive.delete(authUserKey);
    authHive.delete(bearerTokenKey);
  }
}
