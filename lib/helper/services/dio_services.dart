import 'dart:developer';

import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class DioServices extends GetxService {
  DioServices._();

  static final DioServices dioServices = DioServices._();
  static final url = FlavorConfig.instance.variables['baseUrl'];
  factory DioServices() => dioServices;

  static const Duration timeOut = Duration(seconds: 1000);
  static Dio call({
    Duration timeOut = timeOut,
    String? bearerToken,
    String? authorization,
  }) {
    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    if (bearerToken != null) {
      header['token'] = bearerToken;
    }

    if (authorization != null) {
      header['Authorization'] = authorization;
    }

    var dio = Dio(BaseOptions(
      headers: header,
      baseUrl: url,
      connectTimeout: timeOut,
      contentType: 'application/json',
      responseType: ResponseType.json,
    ));

    dio.interceptors.add(_authInterceptor());
    return dio;
  }

  static Interceptor _authInterceptor() {
    return QueuedInterceptorsWrapper(
      onRequest: (reqOptions, handler) {
        log('${reqOptions.uri}', name: 'REQUEST URL');
        log('${reqOptions.headers}', name: 'HEADER');
        reqOptions.extra['startTime'] = DateTime.now().millisecondsSinceEpoch;

        return handler.next(reqOptions);
      },
      onError: (error, handler) async {
        try {
          final startTime = error.response?.requestOptions.extra['startTime'];
          final endTime = DateTime.now().millisecondsSinceEpoch;
          final duration = endTime - startTime;

          log(
            'Request to ${error.response?.requestOptions.uri} took $duration ms.\n${error.response}',
            name: 'RESPONSE',
          );
        } catch (e) {
          log(
            e.toString(),
            name: 'ERROR MESSAGE',
          );
        }

        return handler.next(error);
      },
      onResponse: (response, handler) async {
        final startTime = response.requestOptions.extra['startTime'];
        final endTime = DateTime.now().millisecondsSinceEpoch;
        final duration = endTime - startTime;
        log(
          'Request to ${response.requestOptions.uri} took $duration ms.\n${response.data}',
          name: 'RESPONSE',
        );

        return handler.resolve(response);
      },
    );
  }
}
