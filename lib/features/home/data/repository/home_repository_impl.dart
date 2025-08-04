import 'package:injectable/injectable.dart';
import 'package:shartflix/core/network/response_handler/network_exception_handler.dart';
import 'package:shartflix/core/network/utils/generic_use_case.dart';
import 'package:shartflix/features/home/data/datasource/home_remote_data_source.dart';
import 'package:shartflix/features/home/domain/entities/movie_response.dart';
import 'package:shartflix/features/home/domain/entities/favorite_movie_response.dart';
import 'package:shartflix/features/home/domain/repository/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<MovieResponse> getMovies(PaginationRequest paginationRequest) async {
    return await NetworkExceptionHandler.handleException(() async {
      return await _remoteDataSource.getMovies(paginationRequest);
    });
  }

  @override
  Future<FavoriteMovieResponse> setMovieFavorite(String movieId) async {
    return await NetworkExceptionHandler.handleException(() async {
      return await _remoteDataSource.setMovieFavorite(movieId);
    });
  }
}
