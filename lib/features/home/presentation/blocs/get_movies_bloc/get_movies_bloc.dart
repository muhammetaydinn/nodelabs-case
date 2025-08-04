import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/network/utils/generic_use_case.dart';
import 'package:shartflix/features/home/domain/usecases/get_movies_use_case.dart';
import 'package:shartflix/features/home/presentation/blocs/get_movies_bloc/get_movies_event.dart';
import 'package:shartflix/features/home/presentation/blocs/get_movies_bloc/get_movies_state.dart';

@Injectable()
class GetMoviesBloc extends Bloc<GetMoviesEvent, GetMoviesState> {
  final GetMoviesUseCase _getMoviesUseCase;

  GetMoviesBloc(this._getMoviesUseCase) : super(const GetMoviesInitial()) {
    on<GetMoviesRequested>(_onGetMoviesRequested);
    on<LoadMoreMovies>(_onLoadMoreMovies);
    on<GetMoviesReset>(_onGetMoviesReset);
    on<OnPageChanged>(_onPageChanged);
  }

  Future<void> _onGetMoviesRequested(
    GetMoviesRequested event,
    Emitter<GetMoviesState> emit,
  ) async {
    emit(const GetMoviesLoading());

    try {
      final movieResponse = await _getMoviesUseCase(
        const PaginationRequest(page: 1),
      );

      emit(
        GetMoviesSuccess(
          movies: movieResponse.movies,
          currentPage: 1,
          hasMoreData: movieResponse.movies.length >= 5,
        ),
      );
    } catch (error) {
      emit(GetMoviesFailure(errorMessage: error.toString()));
    }
  }

  Future<void> _onLoadMoreMovies(
    LoadMoreMovies event,
    Emitter<GetMoviesState> emit,
  ) async {
    final currentState = state;

    if (currentState is GetMoviesSuccess &&
        !currentState.isLoadingMore &&
        currentState.hasMoreData) {
      emit(currentState.copyWith(isLoadingMore: true));

      try {
        final nextPage = currentState.currentPage + 1;
        final movieResponse = await _getMoviesUseCase(
          PaginationRequest(page: nextPage),
        );

        final updatedMovies = [...currentState.movies, ...movieResponse.movies];

        emit(
          GetMoviesSuccess(
            movies: updatedMovies,
            currentPage: nextPage,
            hasMoreData: movieResponse.movies.length >= 5,
            isLoadingMore: false,
          ),
        );
      } catch (error) {
        emit(currentState.copyWith(isLoadingMore: false));
      }
    }
  }

  void _onGetMoviesReset(GetMoviesReset event, Emitter<GetMoviesState> emit) {
    emit(const GetMoviesInitial());
  }

  void _onPageChanged(OnPageChanged event, Emitter<GetMoviesState> emit) {
    final currentState = state;
    if (currentState is GetMoviesSuccess) {
      if (event.index >= currentState.movies.length - 2 &&
          currentState.hasMoreData &&
          !currentState.isLoadingMore) {
        add(const LoadMoreMovies());
      }
    }
  }
}
