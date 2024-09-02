import 'package:dio/dio.dart';

import '../config/config.dart';

class DioBaseService {
  static late Dio _dio;

  static Future<void> init() async {
    _dio = Dio(
      BaseOptions(
          baseUrl: Config.baseUrl,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          headers: {}),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (
        RequestOptions options,
        RequestInterceptorHandler handler,
      ) {
        return handler.next(options);
      },
    ));
  }

  static Dio get dio {
    return _dio;
  }
}
