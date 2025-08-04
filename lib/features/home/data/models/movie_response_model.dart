import 'package:shartflix/features/home/data/models/movie_model.dart';
import 'package:shartflix/features/home/domain/entities/movie_response.dart';

class MovieResponseModel extends MovieResponse {
  const MovieResponseModel({required List<MovieModel> movies})
    : super(movies: movies);

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) {
    return MovieResponseModel(
      movies: json['movies'] != null
          ? (json['movies'] as List)
                .map((movieJson) => MovieModel.fromJson(movieJson))
                .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'movies': movies.map((movie) => (movie as MovieModel).toJson()).toList(),
    };
  }
}
