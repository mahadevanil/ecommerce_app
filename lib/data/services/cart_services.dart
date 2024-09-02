import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rapidor/config/config.dart';
import 'package:rapidor/constants/url_constants.dart';

import '../../constants/interceptor.dart';

class CartServices extends DioBaseService {
  final Dio _dio = DioBaseService.dio;
  //add to cart
  Future<Response<dynamic>?> addToCart({
    required String productId,
  }) async {
    try {
      Object body = {
        "userId": "5",
        "date": fCon.formatDate(DateTime.now()),
        'products': [
          {
            "productId": productId,
            "quantity": "1",
          },
        ],
      };
      final response = await _dio.post(
        ApiConst.cartsEndPoint,
        data: body,
      );
      return response;
    } on DioException catch (e) {
      // Handle DioError
      log('Dio error: $e');
      if (e.response != null) {
        log('Dio error status: ${e.response!.statusCode}');
        log('Dio error message: ${e.response!.statusMessage}');
        log('Dio error data: ${e.response!.data}');
      } else {
        log('Dio request failed due to an exception: $e');
      }
      // Return null or rethrow the DioError to propagate it further
      rethrow;
    }
  }

  //add to cart
  Future<Response<dynamic>?> fetchCart() async {
    try {
      final response = await _dio.get(
        "${ApiConst.cartsEndPoint}/5",
      );
      return response;
    } on DioException catch (e) {
      // Handle DioError
      log('Dio error: $e');
      if (e.response != null) {
        log('Dio error status: ${e.response!.statusCode}');
        log('Dio error message: ${e.response!.statusMessage}');
        log('Dio error data: ${e.response!.data}');
      } else {
        log('Dio request failed due to an exception: $e');
      }
      // Return null or rethrow the DioError to propagate it further
      rethrow;
    }
  }
}
