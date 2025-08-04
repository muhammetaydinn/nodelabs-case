import 'package:equatable/equatable.dart';
import 'package:shartflix/features/profile/domain/entities/user.dart';

class LoginResponse extends Equatable {
  final User user;

  const LoginResponse({required this.user});

  @override
  List<Object?> get props => [user];
}
