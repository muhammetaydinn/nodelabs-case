import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/design_system/theme/shartflix_padding.dart';
import '../../../../core/design_system/theme/shartflix_text_styles.dart';
import '../../../home/presentation/blocs/favorites_cubit/favorites_cubit.dart';
import '../../../home/presentation/blocs/favorites_cubit/favorites_state.dart';
import '../blocs/get_favorite_movies_bloc/get_favorite_movies_bloc.dart';
import '../blocs/get_favorite_movies_bloc/get_favorite_movies_event.dart';
import '../blocs/get_favorite_movies_bloc/get_favorite_movies_state.dart';
import 'favorite_movies_grid.dart';
import 'favorite_movies_shimmer_grid.dart';
import 'favorite_movies_empty_state.dart';
import 'favorite_movies_error_state.dart';

class FavoritesSection extends StatelessWidget {
  const FavoritesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final itemWidth = (MediaQuery.of(context).size.width - 2 * 24.w - 16.w) / 2;

    return Padding(
      padding: ShartflixPadding.p24.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.tr('favorites.title'),
            style: ShartflixTextStyles.categoryTitle.copyWith(fontSize: 13.sp),
          ),
          20.verticalSpace,
          BlocListener<FavoritesCubit, FavoritesState>(
            listener: (context, favoritesState) {
              if (favoritesState.lastUpdatedMovieId != null) {
                context.read<GetFavoriteMoviesBloc>().add(
                  const RefreshFavoriteMovies(),
                );
              }
            },
            child: BlocBuilder<GetFavoriteMoviesBloc, GetFavoriteMoviesState>(
              builder: (context, state) {
                if (state is GetFavoriteMoviesLoading) {
                  return FavoriteMoviesShimmerGrid(itemWidth: itemWidth);
                } else if (state is GetFavoriteMoviesSuccess) {
                  if (state.favoriteMovies.isEmpty) {
                    return const FavoriteMoviesEmptyState();
                  }
                  return FavoriteMoviesGrid(
                    movies: state.favoriteMovies,
                    itemWidth: itemWidth,
                  );
                } else if (state is GetFavoriteMoviesError) {
                  return FavoriteMoviesErrorState(message: state.message);
                }
                return FavoriteMoviesShimmerGrid(itemWidth: itemWidth);
              },
            ),
          ),
        ],
      ),
    );
  }
}
