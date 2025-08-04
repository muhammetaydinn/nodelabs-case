import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:shartflix/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:shartflix/features/profile/domain/entities/user.dart';
import 'package:shartflix/features/profile/domain/repository/profile_repository.dart';
import 'package:shartflix/features/home/domain/entities/movie_response.dart';

import '../../../../core/network/response_handler/network_exception_handler.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<User> uploadProfileImage(File imageFile) async {
    return await NetworkExceptionHandler.handleException(() async {
      return await _remoteDataSource.uploadProfileImage(imageFile);
    });
  }

  @override
  Future<User> getProfile() async {
    return await NetworkExceptionHandler.handleException(() async {
      return await _remoteDataSource.getProfile();
    });
  }

  @override
  Future<MovieResponse> getFavoriteMovies() async {
    return await NetworkExceptionHandler.handleException(() async {
      return await _remoteDataSource.getFavoriteMovies();
    });
  }
}
