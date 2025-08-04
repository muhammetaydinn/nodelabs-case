import 'package:equatable/equatable.dart';
import 'package:shartflix/features/authentication/domain/usecases/user_login_use_case.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

final class LoginRequested extends LoginEvent {
  final LoginRequest loginRequest;

  const LoginRequested({required this.loginRequest});

  @override
  List<Object?> get props => [loginRequest];
}

final class LoginReset extends LoginEvent {
  const LoginReset();
}
