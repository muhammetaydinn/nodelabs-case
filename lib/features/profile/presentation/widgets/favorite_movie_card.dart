import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/design_system/custom_widgets/shartflix_image_widgets.dart';
import '../../../../core/design_system/theme/shartflix_colors.dart';
import '../../../../core/design_system/theme/shartflix_sizes.dart';
import '../../../../core/design_system/theme/shartflix_text_styles.dart';
import '../../../home/domain/entities/movie.dart';

class FavoriteMovieCard extends StatelessWidget {
  final Movie movie;
  final double width;

  const FavoriteMovieCard({
    super.key,
    required this.movie,
    required this.width,
  });
  String _convertToHttps(String? url) {
    if (url == null || url.isEmpty) return '';
    if (url.startsWith('http://')) {
      return url.replaceFirst('http://', 'https://');
    }
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2 / 3,
            child: ShartflixImageWidget(imageUrl: _convertToHttps(movie.poster), fit: BoxFit.cover, borderRadius: BorderRadius.circular(8.r)),
          ),
          8.verticalSpace,
          Text(
            movie.title ?? "-",
            style: ShartflixTextStyles.labelMedium.copyWith(
              color: ShartflixColors.white,
              fontSize: ShartflixSizes.size12,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            movie.director ?? "-",
            style: ShartflixTextStyles.movieDescription.copyWith(color: ShartflixColors.white50, fontSize: ShartflixSizes.size12),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
