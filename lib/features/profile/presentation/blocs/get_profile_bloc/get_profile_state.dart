import 'package:equatable/equatable.dart';
import 'package:shartflix/features/profile/domain/entities/user.dart';

sealed class GetProfileState extends Equatable {
  const GetProfileState();

  @override
  List<Object?> get props => [];
}

final class GetProfileInitial extends GetProfileState {
  const GetProfileInitial();
}

final class GetProfileLoading extends GetProfileState {
  const GetProfileLoading();
}

final class GetProfileSuccess extends GetProfileState {
  final User user;

  const GetProfileSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

final class GetProfileFailure extends GetProfileState {
  final String errorMessage;

  const GetProfileFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
