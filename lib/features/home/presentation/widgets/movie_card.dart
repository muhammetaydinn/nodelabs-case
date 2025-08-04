import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/features/home/domain/entities/movie.dart';
import 'package:shartflix/features/home/presentation/widgets/movie_poster_background.dart';
import 'package:shartflix/features/home/presentation/widgets/movie_info_section.dart';
import 'package:shartflix/features/home/presentation/widgets/favorite_button.dart';
import 'package:shartflix/features/home/presentation/blocs/favorites_cubit/favorites_cubit.dart';
import 'package:shartflix/features/home/presentation/blocs/favorites_cubit/favorites_state.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    final navBarHeight = kBottomNavigationBarHeight + bottomPadding + 100.h;

    return Stack(
      fit: StackFit.expand,
      children: [
        MoviePosterBackground(movie: movie),
        MovieInfoSection(movie: movie),
        Positioned(
          bottom: navBarHeight,
          right: 10.w,
          child: BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, favoritesState) {
              final currentFavoriteStatus =
                  favoritesState.favoriteStatuses[movie.id] ??
                  movie.isFavorite ??
                  false;
              return FavoriteButton(
                isFavorite: currentFavoriteStatus,
                onTap: () {
                  context.read<FavoritesCubit>().toggleFavorite(movie);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
