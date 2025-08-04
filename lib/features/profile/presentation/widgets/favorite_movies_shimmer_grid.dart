import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'favorite_movie_card_shimmer.dart';

class FavoriteMoviesShimmerGrid extends StatelessWidget {
  final double itemWidth;

  const FavoriteMoviesShimmerGrid({
    super.key,
    required this.itemWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16.w,
      runSpacing: 16.h,
      children: List.generate(6, (index) {
        return FavoriteMovieCardShimmer(width: itemWidth);
      }),
    );
  }
} 