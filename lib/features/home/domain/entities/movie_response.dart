import 'package:equatable/equatable.dart';
import 'package:shartflix/features/home/domain/entities/movie.dart';

class MovieResponse extends Equatable {
  final List<Movie> movies;

  const MovieResponse({required this.movies});

  @override
  List<Object?> get props => [movies];
}
