import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../home/domain/entities/movie.dart';
import 'favorite_movie_card.dart';

class FavoriteMoviesGrid extends StatelessWidget {
  final List<Movie> movies;
  final double itemWidth;

  const FavoriteMoviesGrid({
    super.key,
    required this.movies,
    required this.itemWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16.w,
      runSpacing: 16.h,
      children: movies.map((movie) {
        return FavoriteMovieCard(
          movie: movie,
          width: itemWidth,
        );
      }).toList(),
    );
  }
}
