import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rapidor/constants/url_constants.dart';

import '../../constants/interceptor.dart';

class ProductsService extends DioBaseService {
  final Dio _dio = DioBaseService.dio;
  //fetch all product data
  Future<Response<dynamic>?> fetchAllProducts() async {
    try {
      final response = await _dio.get(
        ApiConst.productListEndPoint,
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

  //fetch all product data
  Future<Response<dynamic>?> fetchProductDetail({required String id}) async {
    try {
      final response = await _dio.get(
        "${ApiConst.productListEndPoint}/$id",
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
