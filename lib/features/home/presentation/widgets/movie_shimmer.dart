import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_shimmer_widgets.dart';
import 'package:shartflix/core/design_system/theme/shartflix_colors.dart';

class MovieShimmer extends StatelessWidget {
  const MovieShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    final navBarHeight = kBottomNavigationBarHeight + bottomPadding + 100.h;
    final navBarHeightForBackground =
        kBottomNavigationBarHeight + bottomPadding + 20.sp;
    final navBarHeightForInfo =
        kBottomNavigationBarHeight + bottomPadding + 30.h;

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: ClipRect(
            child: Container(
              margin: EdgeInsets.only(bottom: navBarHeightForBackground),
              child: ShimmerBox(
                width: double.infinity,
                height: double.infinity,
                borderRadius: 0,
                baseColor: ShartflixColors.white10,
                highlightColor: ShartflixColors.white20,
              ),
            ),
          ),
        ),

        Positioned(
          bottom: navBarHeightForInfo,
          left: 20.w,
          right: 20.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerBox(
                width: 40.w,
                height: 40.h,
                borderRadius: 20.r,
                baseColor: ShartflixColors.white20,
                highlightColor: ShartflixColors.white30,
              ),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ShimmerBox(
                      width: double.infinity,
                      height: 24.h,
                      borderRadius: 4.r,
                      baseColor: ShartflixColors.white20,
                      highlightColor: ShartflixColors.white30,
                    ),
                    8.verticalSpace,
                    ShimmerBox(
                      width: 0.6.sw,
                      height: 24.h,
                      borderRadius: 4.r,
                      baseColor: ShartflixColors.white20,
                      highlightColor: ShartflixColors.white30,
                    ),
                    12.verticalSpace,
                    ShimmerBox(
                      width: double.infinity,
                      height: 16.h,
                      borderRadius: 4.r,
                      baseColor: ShartflixColors.white20,
                      highlightColor: ShartflixColors.white30,
                    ),
                    6.verticalSpace,
                    ShimmerBox(
                      width: 0.8.sw,
                      height: 16.h,
                      borderRadius: 4.r,
                      baseColor: ShartflixColors.white20,
                      highlightColor: ShartflixColors.white30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Positioned(
          bottom: navBarHeight + 50,
          right: 10.w,
          child: ShimmerBox(
            width: 49.18.w,
            height: 71.7.h,
            borderRadius: 20.r,
            baseColor: ShartflixColors.white20,
            highlightColor: ShartflixColors.white30,
          ),
        ),
      ],
    );
  }
}
