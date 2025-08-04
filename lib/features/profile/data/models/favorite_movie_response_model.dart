import 'package:shartflix/features/home/data/models/movie_model.dart';
import 'package:shartflix/features/home/domain/entities/movie_response.dart';

class FavoriteMovieResponseModel extends MovieResponse {
  const FavoriteMovieResponseModel({required List<MovieModel> movies})
    : super(movies: movies);

  factory FavoriteMovieResponseModel.fromJson(dynamic json) {
    return FavoriteMovieResponseModel(
      movies: json != null
          ? (json as List)
                .map((movieJson) => MovieModel.fromJson(movieJson))
                .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': movies.map((movie) => (movie as MovieModel).toJson()).toList(),
    };
  }
}
