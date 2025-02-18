import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:hive/hive.dart';

class HiveService {
  HiveService._();
  static const String bearerTokenKey = 'bearerTokenKey';
  static final authHive = Hive.box(
    FlavorConfig.instance.variables['localStorage'],
  );

  static saveBearerToken(String token) {
    authHive.put(bearerTokenKey, token);
  }

  static String? getBearerToken() {
    return authHive.get(bearerTokenKey, defaultValue: "");
  }
}
