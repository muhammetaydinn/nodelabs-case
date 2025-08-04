import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shartflix/core/network/dependy_injection/injection.config.dart';

import '../interceptors/token_interceptor.dart';
import '../logger/custom_logger.dart';
import '../token_storage/token_storage.dart';
import '../utils/api_routes.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() {
  getIt.init();
}

@module
abstract class RegisterModule {
  @singleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @singleton
  Dio dio(TokenStorage tokenStorage, TokenInterceptor tokenInterceptor) {
    return _createDioInstance(ApiRoutes.baseUrl, tokenInterceptor);
  }

  Dio _createDioInstance(String baseUrl, Interceptor tokenInterceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(tokenInterceptor);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          CustomLogger().info(
            'Request[${options.method}] => URL: ${options.uri}',
          );
          CustomLogger().info(
            'Request[${options.method}] => DATA: ${options.data}',
          );
          CustomLogger().info(
            'Request[${options.method}] => CONTENT-TYPE: ${options.contentType}',
          );
          handler.next(options);
        },
        onResponse: (response, handler) {
          CustomLogger().info(
            'Response[${response.statusCode}] => DATA: ${response.data}',
          );
          handler.next(response);
        },
        onError: (DioException error, handler) {
          CustomLogger().error(
            'Error[${error.response?.statusCode}] => MESSAGE: ${error.message}',
          );
          handler.next(error);
        },
      ),
    );

    return dio;
  }
}
