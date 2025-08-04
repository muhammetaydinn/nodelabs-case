import 'package:equatable/equatable.dart';
import 'package:shartflix/features/authentication/domain/entities/register_response.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

final class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

final class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

final class RegisterSuccess extends RegisterState {
  final RegisterResponse registerResponse;

  const RegisterSuccess({required this.registerResponse});

  @override
  List<Object?> get props => [registerResponse];
}

final class RegisterFailure extends RegisterState {
  final String errorMessage;

  const RegisterFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
