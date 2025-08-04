import 'package:equatable/equatable.dart';

abstract class GetFavoriteMoviesEvent extends Equatable {
  const GetFavoriteMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteMoviesRequested extends GetFavoriteMoviesEvent {
  const GetFavoriteMoviesRequested();
}

class RefreshFavoriteMovies extends GetFavoriteMoviesEvent {
  const RefreshFavoriteMovies();
} 