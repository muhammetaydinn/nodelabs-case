import 'package:equatable/equatable.dart';

class FavoritesState extends Equatable {
  final Map<String, bool> favoriteStatuses;
  final bool isLoading;
  final String? error;
  final String? lastUpdatedMovieId;

  const FavoritesState({
    this.favoriteStatuses = const {},
    this.isLoading = false,
    this.error,
    this.lastUpdatedMovieId,
  });

  FavoritesState copyWith({
    Map<String, bool>? favoriteStatuses,
    bool? isLoading,
    String? error,
    String? lastUpdatedMovieId,
  }) {
    return FavoritesState(
      favoriteStatuses: favoriteStatuses ?? this.favoriteStatuses,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      lastUpdatedMovieId: lastUpdatedMovieId ?? this.lastUpdatedMovieId,
    );
  }

  @override
  List<Object?> get props => [
        favoriteStatuses,
        isLoading,
        error,
        lastUpdatedMovieId,
      ];
} 