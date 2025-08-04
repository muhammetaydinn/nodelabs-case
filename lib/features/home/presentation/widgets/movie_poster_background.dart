import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_image_widgets.dart';
import 'package:shartflix/features/home/domain/entities/movie.dart';

class MoviePosterBackground extends StatelessWidget {
  final Movie movie;

  const MoviePosterBackground({super.key, required this.movie});

  String _convertToHttps(String? url) {
    if (url == null || url.isEmpty) return '';
    if (url.startsWith('http://')) {
      return url.replaceFirst('http://', 'https://');
    }
    return url;
  }

  @override
  Widget build(BuildContext context) {
    final secureImageUrl = _convertToHttps(movie.poster);
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    final navBarHeight = kBottomNavigationBarHeight + bottomPadding + 20.sp;
    final gradientHeight = (navBarHeight).h;

    return Positioned.fill(
      child: Stack(
        children: [
          ShartflixImageWidget(
            imageUrl: secureImageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: kBottomNavigationBarHeight,
            height: gradientHeight + 100.h,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: gradientHeight + 100.h,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
