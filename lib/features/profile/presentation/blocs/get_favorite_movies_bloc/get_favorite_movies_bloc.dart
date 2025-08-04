import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/network/utils/generic_use_case.dart';
import 'package:shartflix/features/profile/domain/usecases/get_favorite_movies_use_case.dart';
import 'package:shartflix/features/home/presentation/blocs/favorites_cubit/favorites_cubit.dart';
import 'get_favorite_movies_event.dart';
import 'get_favorite_movies_state.dart';

@Injectable()
class GetFavoriteMoviesBloc
    extends Bloc<GetFavoriteMoviesEvent, GetFavoriteMoviesState> {
  final FavoritesCubit? _favoritesCubit;

  GetFavoriteMoviesBloc({FavoritesCubit? favoritesCubit})
    : _favoritesCubit = favoritesCubit,
      super(const GetFavoriteMoviesInitial()) {
    on<GetFavoriteMoviesRequested>(_onGetFavoriteMoviesRequested);
    on<RefreshFavoriteMovies>(_onRefreshFavoriteMovies);
  }

  Future<void> _onGetFavoriteMoviesRequested(
    GetFavoriteMoviesRequested event,
    Emitter<GetFavoriteMoviesState> emit,
  ) async {
    try {
      emit(const GetFavoriteMoviesLoading());
      final movieResponse = await GetFavoriteMoviesUseCase().call(NoParams());

      if (_favoritesCubit != null) {
        for (final movie in movieResponse.movies) {
          _favoritesCubit.updateFavoriteStatus(movie.id ?? '', true);
        }
      }

      emit(GetFavoriteMoviesSuccess(favoriteMovies: movieResponse.movies));
    } catch (e) {
      emit(GetFavoriteMoviesError(message: e.toString()));
    }
  }

  Future<void> _onRefreshFavoriteMovies(
    RefreshFavoriteMovies event,
    Emitter<GetFavoriteMoviesState> emit,
  ) async {
    try {
      final movieResponse = await GetFavoriteMoviesUseCase().call(NoParams());
      emit(GetFavoriteMoviesSuccess(favoriteMovies: movieResponse.movies));
    } catch (e) {
      emit(GetFavoriteMoviesError(message: e.toString()));
    }
  }
}
