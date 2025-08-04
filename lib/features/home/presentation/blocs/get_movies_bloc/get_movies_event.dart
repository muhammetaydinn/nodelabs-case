import 'package:equatable/equatable.dart';

sealed class GetMoviesEvent extends Equatable {
  const GetMoviesEvent();

  @override
  List<Object?> get props => [];
}

final class GetMoviesRequested extends GetMoviesEvent {
  const GetMoviesRequested();
}

final class LoadMoreMovies extends GetMoviesEvent {
  const LoadMoreMovies();
}

final class GetMoviesReset extends GetMoviesEvent {
  const GetMoviesReset();
}

final class OnPageChanged extends GetMoviesEvent {
  final int index;
  
  const OnPageChanged({required this.index});
  
  @override
  List<Object?> get props => [index];
} 