import 'package:equatable/equatable.dart';
import 'package:shartflix/features/home/domain/entities/movie.dart';

abstract class GetFavoriteMoviesState extends Equatable {
  const GetFavoriteMoviesState();

  @override
  List<Object?> get props => [];
}

class GetFavoriteMoviesInitial extends GetFavoriteMoviesState {
  const GetFavoriteMoviesInitial();
}

class GetFavoriteMoviesLoading extends GetFavoriteMoviesState {
  const GetFavoriteMoviesLoading();
}

class GetFavoriteMoviesSuccess extends GetFavoriteMoviesState {
  final List<Movie> favoriteMovies;

  const GetFavoriteMoviesSuccess({required this.favoriteMovies});

  @override
  List<Object?> get props => [favoriteMovies];
}

class GetFavoriteMoviesError extends GetFavoriteMoviesState {
  final String message;

  const GetFavoriteMoviesError({required this.message});

  @override
  List<Object?> get props => [message];
}
