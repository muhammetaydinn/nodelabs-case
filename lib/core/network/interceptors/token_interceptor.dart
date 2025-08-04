import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../services/authentication_service.dart';
import '../logger/custom_logger.dart';
import '../token_storage/token_storage.dart';

@singleton
class TokenInterceptor extends Interceptor {
  final TokenStorage tokenStorage;

  TokenInterceptor(this.tokenStorage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await tokenStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
      CustomLogger().info("Token added to request headers");
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      CustomLogger().warning("401 Unauthorized - Otomatik logout başlatılıyor");
      try {
        await AuthenticationService.handle401Unauthorized();
      } catch (e) {
        CustomLogger().error("401 handler error: $e");
      }
    }
    handler.next(err);
  }
}
