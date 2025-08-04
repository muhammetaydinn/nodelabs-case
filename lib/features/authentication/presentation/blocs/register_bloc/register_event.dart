import 'package:equatable/equatable.dart';
import 'package:shartflix/features/authentication/domain/usecases/user_register_use_case.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

final class RegisterRequested extends RegisterEvent {
  final RegisterRequest registerRequest;

  const RegisterRequested({required this.registerRequest});

  @override
  List<Object?> get props => [registerRequest];
}

final class RegisterReset extends RegisterEvent {
  const RegisterReset();
}
