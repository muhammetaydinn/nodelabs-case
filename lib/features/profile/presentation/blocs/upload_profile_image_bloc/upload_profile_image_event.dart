import 'package:equatable/equatable.dart';
import 'package:shartflix/features/profile/domain/usecases/upload_profile_image_use_case.dart';

sealed class UploadProfileImageEvent extends Equatable {
  const UploadProfileImageEvent();

  @override
  List<Object?> get props => [];
}

final class UploadProfileImageRequested extends UploadProfileImageEvent {
  final UploadProfileImageRequest uploadRequest;

  const UploadProfileImageRequested({required this.uploadRequest});

  @override
  List<Object?> get props => [uploadRequest];
}

final class UploadProfileImageReset extends UploadProfileImageEvent {
  const UploadProfileImageReset();
}
