import 'package:equatable/equatable.dart';
import 'package:shartflix/features/profile/domain/entities/user.dart';

class RegisterResponse extends Equatable {
  final User user;

  const RegisterResponse({required this.user});

  @override
  List<Object?> get props => [user];
}
