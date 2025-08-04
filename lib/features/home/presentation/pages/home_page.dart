import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/core/design_system/theme/shartflix_colors.dart';
import 'package:shartflix/core/network/dependy_injection/injection.dart';
import 'package:shartflix/features/home/presentation/blocs/get_movies_bloc/get_movies_bloc.dart';
import 'package:shartflix/features/home/presentation/blocs/get_movies_bloc/get_movies_event.dart';
import 'package:shartflix/features/home/presentation/blocs/get_movies_bloc/get_movies_state.dart';
import 'package:shartflix/features/home/presentation/widgets/movies_loading_view.dart';
import 'package:shartflix/features/home/presentation/widgets/movies_error_view.dart';
import 'package:shartflix/features/home/presentation/widgets/movies_list_view.dart';

class HomePage extends StatefulWidget {
  static const String name = '/HomePage';
  static const String path = '/HomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GetMoviesBloc _getMoviesBloc;

  @override
  void initState() {
    super.initState();
    _getMoviesBloc = getIt<GetMoviesBloc>();
    _getMoviesBloc.add(const GetMoviesRequested());
  }

  @override
  void dispose() {
    _getMoviesBloc.close();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    _getMoviesBloc.add(const GetMoviesRequested());
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ShartflixColors.darkBackground,
      body: BlocProvider.value(
        value: _getMoviesBloc,
        child: BlocBuilder<GetMoviesBloc, GetMoviesState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: _onRefresh,
              backgroundColor: ShartflixColors.darkBackground,
              color: ShartflixColors.brandRed,
              child: switch (state) {
                GetMoviesLoading() => const MoviesLoadingView(),
                GetMoviesFailure() => MoviesErrorView(
                  errorMessage: state.errorMessage,
                ),
                GetMoviesSuccess() => MoviesListView(
                  movies: state.movies,
                  isLoadingMore: state.isLoadingMore,
                ),
                _ => const MoviesLoadingView(),
              },
            );
          },
        ),
      ),
    );
  }
}
