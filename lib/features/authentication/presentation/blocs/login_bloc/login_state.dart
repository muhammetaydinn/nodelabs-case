import 'package:equatable/equatable.dart';
import 'package:shartflix/features/authentication/domain/entities/login_response.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

final class LoginInitial extends LoginState {
  const LoginInitial();
}

final class LoginLoading extends LoginState {
  const LoginLoading();
}

final class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;

  const LoginSuccess({required this.loginResponse});

  @override
  List<Object?> get props => [loginResponse];
}

final class LoginFailure extends LoginState {
  final String errorMessage;

  const LoginFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
