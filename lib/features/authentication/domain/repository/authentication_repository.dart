import 'package:shartflix/features/authentication/domain/entities/login_response.dart';
import 'package:shartflix/features/authentication/domain/entities/register_response.dart';
import 'package:shartflix/features/authentication/domain/usecases/user_login_use_case.dart';
import 'package:shartflix/features/authentication/domain/usecases/user_register_use_case.dart';

abstract class AuthenticationRepository {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<RegisterResponse> register(RegisterRequest registerRequest);
}
