import 'package:injectable/injectable.dart';
import 'package:shartflix/core/network/api_service/api_service.dart';
import 'package:shartflix/core/network/response_handler/api_response.dart';
import 'package:shartflix/core/network/response_handler/network_exception_handler.dart';
import 'package:shartflix/core/network/utils/api_routes.dart';
import 'package:shartflix/core/network/utils/generic_use_case.dart';
import 'package:shartflix/features/home/data/models/movie_response_model.dart';
import 'package:shartflix/features/home/data/models/favorite_movie_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<MovieResponseModel> getMovies(PaginationRequest paginationRequest);
  Future<FavoriteMovieResponseModel> setMovieFavorite(String movieId);
}

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<MovieResponseModel> getMovies(
    PaginationRequest paginationRequest,
  ) async {
    return await NetworkExceptionHandler.handleException(() async {
      final response = await _apiService.getRequest(
        ApiRoutes.getMovieList,
        queryParams: paginationRequest.toJson(),
      );

      final apiResponse = ApiResponse.fromJson(
        response.data,
        (data) => MovieResponseModel.fromJson(data),
      );

      return NetworkExceptionHandler.checkResponse(apiResponse);
    });
  }

  @override
  Future<FavoriteMovieResponseModel> setMovieFavorite(String movieId) async {
    return await NetworkExceptionHandler.handleException(() async {
      final response = await _apiService.postRequest(
        ApiRoutes.setMovieFavorite(movieId),
      );

      final apiResponse = ApiResponse.fromJson(
        response.data,
        (data) => FavoriteMovieResponseModel.fromJson(data),
      );

      return NetworkExceptionHandler.checkResponse(apiResponse);
    });
  }
}
