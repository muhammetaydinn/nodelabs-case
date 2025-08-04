import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../interceptors/token_interceptor.dart';
import '../token_storage/token_storage.dart';

@singleton
class ApiService {
  final Dio dio;
  final TokenStorage tokenStorage;

  ApiService(this.dio, this.tokenStorage) {
    dio.interceptors.add(TokenInterceptor(tokenStorage));
  }

  Future<Response> getRequest(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await dio.get(endpoint, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception("Oturum süreniz dolmuş. Lütfen tekrar giriş yapın.");
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postRequest(String endpoint, {dynamic data, Map<String, dynamic>? queryParams, Options? options}) async {
    try {
      final response = await dio.post(endpoint, data: data, queryParameters: queryParams, options: options);
      return response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception("Oturum süreniz dolmuş. Lütfen tekrar giriş yapın.");
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> putRequest(String endpoint, {dynamic data, Map<String, dynamic>? queryParams, Options? options}) async {
    try {
      final response = await dio.put(endpoint, data: data, queryParameters: queryParams, options: options);
      return response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception("Oturum süreniz dolmuş. Lütfen tekrar giriş yapın.");
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteRequest(String endpoint, {Map<String, dynamic>? queryParams, Options? options}) async {
    try {
      final response = await dio.delete(endpoint, queryParameters: queryParams, options: options);
      return response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception("Oturum süreniz dolmuş. Lütfen tekrar giriş yapın.");
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
