import 'package:delivery_food/modules/auth/models/user_model.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:hive/hive.dart';

class HiveService {
  HiveService._();
  static const String authUserKey = 'authKey';
  static final authHive = Hive.box(
    FlavorConfig.instance.variables['localStorage'],
  );

  static saveAuth(AuthModel user) {
    authHive.put(authUserKey, user);
  }

  static AuthModel? getAuth() {
    final data = authHive.get(authUserKey);
    if (data == null) return null;
    return data as AuthModel;
  }

  static clearAuth() {
    authHive.delete(authUserKey);
  }
}
