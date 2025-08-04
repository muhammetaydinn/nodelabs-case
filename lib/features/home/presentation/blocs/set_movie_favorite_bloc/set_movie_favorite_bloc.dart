import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/features/home/domain/usecases/set_movie_favorite_use_case.dart';
import 'set_movie_favorite_event.dart';
import 'set_movie_favorite_state.dart';

@Injectable()
class SetMovieFavoriteBloc
    extends Bloc<SetMovieFavoriteEvent, SetMovieFavoriteState> {
  SetMovieFavoriteBloc() : super(const SetMovieFavoriteInitial()) {
    on<SetMovieFavoriteRequested>(_onSetMovieFavoriteRequested);
  }

  Future<void> _onSetMovieFavoriteRequested(
    SetMovieFavoriteRequested event,
    Emitter<SetMovieFavoriteState> emit,
  ) async {
    try {
      emit(const SetMovieFavoriteLoading());
      final favoriteResponse = await SetMovieFavoriteUseCase().call(
        SetMovieFavoriteParams(movieId: event.movieId),
      );
      emit(
        SetMovieFavoriteSuccess(
          movie: favoriteResponse.movie,
          action: favoriteResponse.action,
        ),
      );
    } catch (e) {
      emit(SetMovieFavoriteError(message: e.toString()));
    }
  }
}
