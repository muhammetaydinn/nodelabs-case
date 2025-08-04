import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shartflix/core/design_system/theme/shartflix_colors.dart';
import 'package:shartflix/core/design_system/theme/shartflix_text_styles.dart';
import 'package:shartflix/features/home/domain/entities/movie.dart';

class MovieInfoSection extends StatefulWidget {
  final Movie movie;

  const MovieInfoSection({super.key, required this.movie});

  @override
  State<MovieInfoSection> createState() => _MovieInfoSectionState();
}

class _MovieInfoSectionState extends State<MovieInfoSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    final navBarHeight = kBottomNavigationBarHeight + bottomPadding + 30.h;

    return Positioned(
      bottom: navBarHeight,
      left: 20.w,
      right: 20.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: ShartflixColors.brandRed,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                "assets/images/profile_placeholder.png",
                width: 40.w,
                height: 40.h,
              ),
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.movie.title ?? "",
                  style: ShartflixTextStyles.movieTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (widget.movie.plot != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.movie.plot!,
                        style: ShartflixTextStyles.movieSubtitle.copyWith(
                          fontSize: 13.sp,
                        ),
                        maxLines: _isExpanded ? null : 2,
                        overflow: _isExpanded ? null : TextOverflow.ellipsis,
                      ),
                      if (widget.movie.plot!.length >
                          100) // Only show if text is long enough
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isExpanded = !_isExpanded;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 4.h),
                            child: Text(
                              _isExpanded
                                  ? context.tr('movie.readLess')
                                  : context.tr('movie.readMore'),
                              style: ShartflixTextStyles.movieSubtitle.copyWith(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
