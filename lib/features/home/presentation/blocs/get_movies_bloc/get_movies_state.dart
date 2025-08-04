import 'package:equatable/equatable.dart';
import 'package:shartflix/features/home/domain/entities/movie.dart';

sealed class GetMoviesState extends Equatable {
  const GetMoviesState();

  @override
  List<Object?> get props => [];
}

final class GetMoviesInitial extends GetMoviesState {
  const GetMoviesInitial();
}

final class GetMoviesLoading extends GetMoviesState {
  const GetMoviesLoading();
}

final class GetMoviesSuccess extends GetMoviesState {
  final List<Movie> movies;
  final int currentPage;
  final bool hasMoreData;
  final bool isLoadingMore;

  const GetMoviesSuccess({
    required this.movies,
    required this.currentPage,
    required this.hasMoreData,
    this.isLoadingMore = false,
  });

  @override
  List<Object?> get props => [movies, currentPage, hasMoreData, isLoadingMore];

  GetMoviesSuccess copyWith({
    List<Movie>? movies,
    int? currentPage,
    bool? hasMoreData,
    bool? isLoadingMore,
  }) {
    return GetMoviesSuccess(
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

final class GetMoviesFailure extends GetMoviesState {
  final String errorMessage;

  const GetMoviesFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
