import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shartflix/core/network/logger/custom_logger.dart';

import 'api_response.dart';

/// Network exception handler to properly handle API errors
class NetworkExceptionHandler {
  static final CustomLogger _logger = CustomLogger(level: LogLevel.error);

  /// Handle exceptions from API calls and convert them to ApiException
  static Future<T> handleException<T>(Future<T> Function() apiCall) async {
    try {
      return await apiCall();
    } on DioException catch (e) {
      _logger.error('DioException: ${e.message}', e, e.stackTrace);
      _logger.error('DioException Response: ${e.response?.data}');
      _logger.error('DioException Status Code: ${e.response?.statusCode}');

      // Handle Dio specific errors
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          throw ApiException(
            message:
                'Bağlantı zaman aşımına uğradı. Lütfen internet bağlantınızı kontrol edin.',
            code: 408,
            status: false,
          );

        case DioExceptionType.badResponse:
          // Try to parse error response
          if (e.response != null) {
            final responseData = e.response!.data;
            _logger.error('Bad Response Data: $responseData');

            if (responseData is Map<String, dynamic>) {
              final response =
                  responseData['response'] as Map<String, dynamic>? ?? {};
              final code =
                  response['code'] as int? ?? e.response!.statusCode ?? 500;
              final message =
                  response['message']?.toString() ??
                  'Bilinmeyen bir hata oluştu';

              throw ApiException(
                message: message.isEmpty ? 'Sunucu hatası oluştu' : message,
                code: code,
                status: false,
              );
            }
          }
          throw ApiException(
            message:
                'Sunucu hatası: ${e.response?.statusMessage ?? 'Bilinmeyen hata'}',
            code: e.response?.statusCode ?? 500,
            status: false,
          );

        case DioExceptionType.cancel:
          throw ApiException(
            message: 'İstek iptal edildi',
            code: 499,
            status: false,
          );

        default:
          throw ApiException(
            message: e.message ?? 'Bilinmeyen bir hata oluştu',
            code: 500,
            status: false,
          );
      }
    } on SocketException catch (e) {
      _logger.error('SocketException: ${e.message}', e);
      throw ApiException(
        message:
            'İnternet bağlantısı yok. Lütfen ağ ayarlarınızı kontrol edin.',
        code: 503,
        status: false,
      );
    } on FormatException catch (e) {
      _logger.error('FormatException: ${e.message}', e);
      throw ApiException(
        message: 'Sunucudan geçersiz veri formatı alındı.',
        code: 422,
        status: false,
      );
    } catch (e, stackTrace) {
      _logger.error('Unknown exception: $e');
      _logger.error('Stack trace: $stackTrace');
      throw ApiException(
        message: 'Beklenmeyen bir hata oluştu: $e',
        code: 500,
        status: false,
      );
    }
  }

  static T checkResponse<T>(ApiResponse<T> response) {
    if (response.isSuccess) {
      return response.data;
    } else {
      _logger.error('API Response Error: ${response.message}');
      throw ApiException(
        message: response.message.isEmpty
            ? 'Sunucu hatası oluştu'
            : response.message,
        code: response.code,
        status: response.status,
      );
    }
  }
}
