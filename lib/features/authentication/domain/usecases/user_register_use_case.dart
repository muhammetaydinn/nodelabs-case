import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/network/utils/generic_use_case.dart';
import 'package:shartflix/features/authentication/domain/entities/register_response.dart';
import 'package:shartflix/features/authentication/domain/repository/authentication_repository.dart';

import '../../../../core/network/dependy_injection/injection.dart';

@Injectable()
class UserRegisterUseCase
    implements UseCase<RegisterResponse, RegisterRequest> {
  UserRegisterUseCase();
  AuthenticationRepository get _repository => getIt<AuthenticationRepository>();

  @override
  Future<RegisterResponse> call(RegisterRequest params) async {
    return await _repository.register(params);
  }
}

class RegisterRequest extends Equatable {
  final String email;
  final String name;
  final String password;

  const RegisterRequest({
    required this.email,
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'name': name, 'password': password};
  }

  @override
  List<Object?> get props => [email, name, password];
}
