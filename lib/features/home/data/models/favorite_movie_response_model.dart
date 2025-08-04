import 'package:shartflix/features/home/data/models/movie_model.dart';
import 'package:shartflix/features/home/domain/entities/favorite_movie_response.dart';

class FavoriteMovieResponseModel extends FavoriteMovieResponse {
  const FavoriteMovieResponseModel({
    required MovieModel movie,
    required String action,
  }) : super(movie: movie, action: action);

  factory FavoriteMovieResponseModel.fromJson(Map<String, dynamic> json) {
    return FavoriteMovieResponseModel(
      movie: MovieModel.fromJson(json['movie']),
      action: json['action'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'movie': (movie as MovieModel).toJson(), 'action': action};
  }
}
