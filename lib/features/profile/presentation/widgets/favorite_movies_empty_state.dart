import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/design_system/theme/shartflix_colors.dart';
import '../../../../core/design_system/theme/shartflix_text_styles.dart';

class FavoriteMoviesEmptyState extends StatelessWidget {
  const FavoriteMoviesEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: Text(
          context.tr('favorites.emptyMessage'),
          style: ShartflixTextStyles.labelMedium.copyWith(
            color: ShartflixColors.white50,
            fontSize: 14.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
