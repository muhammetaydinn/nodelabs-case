import 'package:shartflix/core/network/utils/generic_use_case.dart';
import 'package:shartflix/features/home/domain/entities/movie_response.dart';
import 'package:shartflix/features/home/domain/entities/favorite_movie_response.dart';

abstract class HomeRepository {
  Future<MovieResponse> getMovies(PaginationRequest paginationRequest);
  Future<FavoriteMovieResponse> setMovieFavorite(String movieId);
}
