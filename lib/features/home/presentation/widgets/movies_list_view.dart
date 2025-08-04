import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/features/home/domain/entities/movie.dart';
import 'package:shartflix/features/home/presentation/blocs/get_movies_bloc/get_movies_bloc.dart';
import 'package:shartflix/features/home/presentation/blocs/get_movies_bloc/get_movies_event.dart';
import 'package:shartflix/features/home/presentation/widgets/movie_card.dart';
import 'package:shartflix/features/home/presentation/widgets/movie_shimmer.dart';

class MoviesListView extends StatelessWidget {
  final List<Movie> movies;
  final bool isLoadingMore;

  const MoviesListView({
    super.key,
    required this.movies,
    required this.isLoadingMore,
  });

  @override
  Widget build(BuildContext context) {
    final totalItems = movies.length + (isLoadingMore ? 1 : 0);

    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      itemCount: totalItems,
      onPageChanged: (index) =>
          context.read<GetMoviesBloc>().add(OnPageChanged(index: index)),
      itemBuilder: (context, index) {
        if (index >= movies.length) {
          return const MovieShimmer();
        }

        return MovieCard(movie: movies[index]);
      },
    );
  }
}
