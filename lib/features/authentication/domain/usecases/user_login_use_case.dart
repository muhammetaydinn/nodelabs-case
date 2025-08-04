import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/network/utils/generic_use_case.dart';
import 'package:shartflix/features/authentication/domain/entities/login_response.dart';
import 'package:shartflix/features/authentication/domain/repository/authentication_repository.dart';

import '../../../../core/network/dependy_injection/injection.dart';

@Injectable()
class UserLoginUseCase implements UseCase<LoginResponse, LoginRequest> {
  UserLoginUseCase();
  AuthenticationRepository get _repository => getIt<AuthenticationRepository>();

  @override
  Future<LoginResponse> call(LoginRequest params) async {
    return await _repository.login(params);
  }
}

class LoginRequest extends Equatable {
  final String email;
  final String password;

  const LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  @override
  List<Object?> get props => [email, password];
}
