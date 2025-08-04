import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/network/api_service/api_service.dart';
import 'package:shartflix/core/network/response_handler/api_response.dart';
import 'package:shartflix/core/network/response_handler/network_exception_handler.dart';
import 'package:shartflix/core/network/utils/api_routes.dart';
import 'package:shartflix/features/profile/data/models/user_model.dart';
import 'package:shartflix/features/profile/data/models/favorite_movie_response_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> uploadProfileImage(File imageFile);
  Future<UserModel> getProfile();
  Future<FavoriteMovieResponseModel> getFavoriteMovies();
}

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiService _apiService;

  ProfileRemoteDataSourceImpl(this._apiService);

  @override
  Future<UserModel> uploadProfileImage(File imageFile) async {
    return await NetworkExceptionHandler.handleException(() async {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
      });

      final response = await _apiService.postRequest(
        ApiRoutes.uploadPhoto,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      final apiResponse = ApiResponse.fromJson(
        response.data,
        (data) => UserModel.fromJson(data),
      );

      return NetworkExceptionHandler.checkResponse(apiResponse);
    });
  }

  @override
  Future<UserModel> getProfile() async {
    return await NetworkExceptionHandler.handleException(() async {
      final response = await _apiService.getRequest(ApiRoutes.userProfile);

      final apiResponse = ApiResponse.fromJson(
        response.data,
        (data) => UserModel.fromJson(data),
      );

      return NetworkExceptionHandler.checkResponse(apiResponse);
    });
  }

  @override
  Future<FavoriteMovieResponseModel> getFavoriteMovies() async {
    return await NetworkExceptionHandler.handleException(() async {
      final response = await _apiService.getRequest(ApiRoutes.getFavorites);

      final apiResponse = ApiResponse.fromJson(
        response.data,
        (data) => FavoriteMovieResponseModel.fromJson(data),
      );

      return NetworkExceptionHandler.checkResponse(apiResponse);
    });
  }
}
