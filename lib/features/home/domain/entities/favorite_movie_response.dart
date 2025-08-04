import 'package:equatable/equatable.dart';
import 'package:shartflix/features/home/domain/entities/movie.dart';

class FavoriteMovieResponse extends Equatable {
  final Movie movie;
  final String action;

  const FavoriteMovieResponse({required this.movie, required this.action});

  @override
  List<Object?> get props => [movie, action];
}
