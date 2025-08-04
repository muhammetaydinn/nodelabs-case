import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/design_system/custom_widgets/shartflix_shimmer_widgets.dart';

class FavoriteMovieCardShimmer extends StatelessWidget {
  final double width;

  const FavoriteMovieCardShimmer({
    super.key,

    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerBox(
            width: width,
            height: 180.h,
            borderRadius: 8.r,
          ),
          8.verticalSpace,
          ShimmerText(
            width: width * 0.8,
            height: 14.h,
          ),
          4.verticalSpace,
          ShimmerText(
            width: width * 0.6,
            height: 12.h,
          ),
        ],
      ),
    );
  }
}
