import 'package:flutter/material.dart';
import 'package:shartflix/features/home/presentation/widgets/movie_shimmer.dart';

class MoviesLoadingView extends StatelessWidget {
  const MoviesLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 3,
      itemBuilder: (context, index) => const MovieShimmer(),
    );
  }
}
