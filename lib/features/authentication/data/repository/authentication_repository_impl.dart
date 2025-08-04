import 'package:injectable/injectable.dart';
import 'package:shartflix/features/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:shartflix/features/authentication/domain/entities/login_response.dart';
import 'package:shartflix/features/authentication/domain/entities/register_response.dart';
import 'package:shartflix/features/authentication/domain/usecases/user_login_use_case.dart';
import 'package:shartflix/features/authentication/domain/usecases/user_register_use_case.dart';

import '../../../../core/network/response_handler/network_exception_handler.dart';
import '../../domain/repository/authentication_repository.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource _remoteDataSource;

  AuthenticationRepositoryImpl(this._remoteDataSource);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await NetworkExceptionHandler.handleException(() async {
      return await _remoteDataSource.login(loginRequest);
    });
  }

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    return await NetworkExceptionHandler.handleException(() async {
      return await _remoteDataSource.register(registerRequest);
    });
  }
}
