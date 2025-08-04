import 'package:equatable/equatable.dart';
import 'package:shartflix/features/profile/domain/entities/user.dart';

sealed class UploadProfileImageState extends Equatable {
  const UploadProfileImageState();

  @override
  List<Object?> get props => [];
}

final class UploadProfileImageInitial extends UploadProfileImageState {
  const UploadProfileImageInitial();
}

final class UploadProfileImageLoading extends UploadProfileImageState {
  const UploadProfileImageLoading();
}

final class UploadProfileImageSuccess extends UploadProfileImageState {
  final User updatedUser;

  const UploadProfileImageSuccess({required this.updatedUser});

  @override
  List<Object?> get props => [updatedUser];
}

final class UploadProfileImageFailure extends UploadProfileImageState {
  final String errorMessage;

  const UploadProfileImageFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
