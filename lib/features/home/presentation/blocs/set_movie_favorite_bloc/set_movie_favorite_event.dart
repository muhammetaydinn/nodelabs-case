import 'package:equatable/equatable.dart';

sealed class SetMovieFavoriteEvent extends Equatable {
  const SetMovieFavoriteEvent();

  @override
  List<Object> get props => [];
}

class SetMovieFavoriteRequested extends SetMovieFavoriteEvent {
  final String movieId;

  const SetMovieFavoriteRequested({required this.movieId});

  @override
  List<Object> get props => [movieId];
} 