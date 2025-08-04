import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/features/home/domain/entities/movie.dart';
import 'package:shartflix/features/home/domain/usecases/set_movie_favorite_use_case.dart';
import '../../../../../core/services/firebase_services/analytics_service.dart';
import 'favorites_state.dart';

@Injectable()
class FavoritesCubit extends Cubit<FavoritesState> {
  final SetMovieFavoriteUseCase _setMovieFavoriteUseCase;

  FavoritesCubit(this._setMovieFavoriteUseCase) : super(const FavoritesState());

  Future<void> toggleFavorite(Movie movie) async {
    try {
      emit(state.copyWith(isLoading: true));

      final response = await _setMovieFavoriteUseCase.call(
        SetMovieFavoriteParams(movieId: movie.id ?? ''),
      );

      final updatedFavorites = Map<String, bool>.from(state.favoriteStatuses);

      if (response.action == 'favorited') {
        updatedFavorites[movie.id ?? ''] = true;
        await FirebaseAnalyticsService().logEvent(
          AnalyticsEventNames.favoriteMovie,
          parameters: {'movie_id': movie.id ?? ''},
        );
      } else {
        updatedFavorites[movie.id ?? ''] = false;
        // Favoriden çıkarıldı eventini logla
        await FirebaseAnalyticsService().logEvent(
          AnalyticsEventNames.unfavoriteMovie,
          parameters: {'movie_id': movie.id ?? ''},
        );
      }

      emit(
        state.copyWith(
          favoriteStatuses: updatedFavorites,
          isLoading: false,
          lastUpdatedMovieId: movie.id,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void updateFavoriteStatus(String movieId, bool isFavorite) {
    final updatedFavorites = Map<String, bool>.from(state.favoriteStatuses);
    updatedFavorites[movieId] = isFavorite;

    emit(
      state.copyWith(
        favoriteStatuses: updatedFavorites,
        lastUpdatedMovieId: movieId,
      ),
    );
  }

  bool isFavorite(String movieId) {
    return state.favoriteStatuses[movieId] ?? false;
  }

  void clearError() {
    emit(state.copyWith(error: null));
  }
}
