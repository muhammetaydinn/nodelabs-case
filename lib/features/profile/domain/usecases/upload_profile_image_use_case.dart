import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/network/utils/generic_use_case.dart';
import 'package:shartflix/features/profile/domain/entities/user.dart';
import 'package:shartflix/features/profile/domain/repository/profile_repository.dart';

import '../../../../core/network/dependy_injection/injection.dart';

class UploadProfileImageRequest extends Equatable {
  final File imageFile;

  const UploadProfileImageRequest({required this.imageFile});

  @override
  List<Object?> get props => [imageFile];
}

@Injectable()
class UploadProfileImageUseCase
    implements UseCase<User, UploadProfileImageRequest> {
  UploadProfileImageUseCase();

  ProfileRepository get _repository => getIt<ProfileRepository>();

  @override
  Future<User> call(UploadProfileImageRequest params) async {
    return await _repository.uploadProfileImage(params.imageFile);
  }
}
