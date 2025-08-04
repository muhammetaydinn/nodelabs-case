import 'package:equatable/equatable.dart';
import 'package:shartflix/features/home/domain/entities/movie.dart';

sealed class SetMovieFavoriteState extends Equatable {
  const SetMovieFavoriteState();

  @override
  List<Object> get props => [];
}

class SetMovieFavoriteInitial extends SetMovieFavoriteState {
  const SetMovieFavoriteInitial();
}

class SetMovieFavoriteLoading extends SetMovieFavoriteState {
  const SetMovieFavoriteLoading();
}

class SetMovieFavoriteSuccess extends SetMovieFavoriteState {
  final Movie movie;
  final String action;

  const SetMovieFavoriteSuccess({required this.movie, required this.action});

  @override
  List<Object> get props => [movie, action];
}

class SetMovieFavoriteError extends SetMovieFavoriteState {
  final String message;

  const SetMovieFavoriteError({required this.message});

  @override
  List<Object> get props => [message];
}
