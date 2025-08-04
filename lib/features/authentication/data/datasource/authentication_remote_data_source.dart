import 'package:injectable/injectable.dart';
import 'package:shartflix/core/network/api_service/api_service.dart';
import 'package:shartflix/features/authentication/data/models/login_response_model.dart';
import 'package:shartflix/features/authentication/data/models/register_response_model.dart';
import 'package:shartflix/features/authentication/domain/usecases/user_login_use_case.dart';
import 'package:shartflix/features/authentication/domain/usecases/user_register_use_case.dart';

import '../../../../core/network/response_handler/api_response.dart';
import '../../../../core/network/response_handler/network_exception_handler.dart';
import '../../../../core/network/utils/api_routes.dart';

abstract class AuthenticationRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequest loginRequest);
  Future<RegisterResponseModel> register(RegisterRequest registerRequest);
}

@Injectable(as: AuthenticationRemoteDataSource)
class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final ApiService _apiService;

  AuthenticationRemoteDataSourceImpl(this._apiService);

  @override
  Future<LoginResponseModel> login(LoginRequest loginRequest) async {
    return await NetworkExceptionHandler.handleException(() async {
      final response = await _apiService.postRequest(
        ApiRoutes.userLogin,
        data: loginRequest.toJson(),
      );

      final apiResponse = ApiResponse.fromJson(
        response.data,
        (data) => LoginResponseModel.fromJson(data),
      );

      return NetworkExceptionHandler.checkResponse(apiResponse);
    });
  }

  @override
  Future<RegisterResponseModel> register(
    RegisterRequest registerRequest,
  ) async {
    return await NetworkExceptionHandler.handleException(() async {
      final response = await _apiService.postRequest(
        ApiRoutes.userRegister,
        data: registerRequest.toJson(),
      );

      final apiResponse = ApiResponse.fromJson(
        response.data,
        (data) => RegisterResponseModel.fromJson(data),
      );

      return NetworkExceptionHandler.checkResponse(apiResponse);
    });
  }
}
